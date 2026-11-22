import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:ud2_t2_usr3498_navegacion/shared/exceptions/app_exception.dart';

class HttpService {
  HttpService._internal();
  static final HttpService _instance = HttpService._internal();
  factory HttpService.getInstance() => _instance;

  static const Duration _timeoutDuration = Duration(seconds: 90);

  Map<String, String> _headers(String? token) => {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      };

  Future<Map<String, dynamic>> get(String urlRequest, {String? token}) {
    final uri = Uri.parse(urlRequest);
    return _sendRequest(() => http.get(uri, headers: _headers(token)));
  }

  Future<Map<String, dynamic>> post(
    String urlRequest,
    Map<String, dynamic> data, {
    String? token,
  }) {
    final uri = Uri.parse(urlRequest);
    return _sendRequest(
      () => http.post(uri, headers: _headers(token), body: jsonEncode(data)),
    );
  }

  Future<Map<String, dynamic>> put(
    String urlRequest,
    Map<String, dynamic> data, {
    String? token,
  }) {
    final uri = Uri.parse(urlRequest);
    return _sendRequest(
      () => http.put(uri, headers: _headers(token), body: jsonEncode(data)),
    );
  }

  Future<Map<String, dynamic>> delete(String urlRequest, {String? token}) {
    final uri = Uri.parse(urlRequest);
    return _sendRequest(() => http.delete(uri, headers: _headers(token)));
  }

  Future<Map<String, dynamic>> _sendRequest(
    Future<http.Response> Function() request,
  ) async {
    try {
      final response = await request().timeout(_timeoutDuration);
      return _processResponse(response);
    } on AppException {
      rethrow;
    } on TimeoutException catch (e, st) {
      throw AppTimeoutException(originalError: e, stackTrace: st);
    } on SocketException catch (e, st) {
      throw AppNetworkException(originalError: e, stackTrace: st);
    } on http.ClientException catch (e, st) {
      throw AppNetworkException(originalError: e, stackTrace: st);
    }
  }

  Map<String, dynamic> _processResponse(http.Response response) {
    Map<String, dynamic> body = {};
    try {
      final decoded = jsonDecode(utf8.decode(response.bodyBytes));
      if (decoded is Map<String, dynamic>) body = decoded;
    } catch (_) {
      body = {};
    }
    final apiMessage = body['message']?.toString();

    switch (response.statusCode) {
      case 200:
      case 201:
      case 204:
        return body;
      case 400:
        throw BadRequestException(message: apiMessage ?? 'Petición incorrecta (400).');
      case 401:
        throw UnauthorizedException(
            message: apiMessage ?? 'No tienes autorización (401).');
      case 404:
        throw NotFoundException(message: apiMessage ?? 'Recurso no encontrado (404).');
      case 409:
        throw ConflictException(message: apiMessage ?? 'Conflicto en la petición (409).');
      default:
        throw ServerException(
            message: apiMessage ?? 'Error del servidor [${response.statusCode}].');
    }
  }
}