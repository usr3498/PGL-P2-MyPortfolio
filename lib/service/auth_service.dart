import 'package:ud2_t2_usr3498_navegacion/models/login_response.dart';
import 'package:ud2_t2_usr3498_navegacion/service/http_service.dart';
import 'package:ud2_t2_usr3498_navegacion/service/token_storage.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/exceptions/app_exception.dart';

class AuthService {
  AuthService._internal();
  static final AuthService _instance = AuthService._internal();
  factory AuthService.getInstance() => _instance;

  static const String _apiUrl = 'https://my-users-api.onrender.com';
  static const String _usersEndpoint = 'users';
  static const String _usersUrl = '$_apiUrl/$_usersEndpoint';

  final HttpService _http = HttpService.getInstance();
  final TokenStorage _tokenStorage = TokenStorage.getInstance();

  Future<String> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    final data = await _http.post('$_usersUrl/register', {
      'fullName': fullName,
      'email': email,
      'pwd': password,
    });
    return data['message']?.toString() ?? 'Usuario registrado con éxito.';
  }

  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    final data = await _http.post('$_usersUrl/login', {
      'email': email,
      'pwd': password,
    });
    final response = LoginResponse.fromJson(data);
    if (response.token.isEmpty) {
      throw ServerException(message: 'El servidor no devolvió un token de sesión.');
    }
    await _tokenStorage.saveToken(response.token);
    return response;
  }

  Future<bool> hasValidSession() async {
    try {
      final token = await _tokenStorage.readToken();
      if (token == null) return false;
      await _http.get('$_usersUrl/check-token', token: token);
      return true;
    } on UnauthorizedException {
      await _tokenStorage.deleteToken();
      return false;
    } on AppException {
      return false;
    } catch (_) {
      return false;
    }
  }

  Future<String> getWelcomeMessage() async {
    final token = await _tokenStorage.readToken();
    if (token == null) {
      throw UnauthorizedException(message: 'No hay una sesión iniciada.');
    }
    final data = await _http.get('$_usersUrl/welcome', token: token);
    return data['message']?.toString() ?? '';
  }

  Future<void> logout() => _tokenStorage.deleteToken();
}