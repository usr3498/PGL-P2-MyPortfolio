import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  TokenStorage._internal();
  static final TokenStorage _instance = TokenStorage._internal();
  factory TokenStorage.getInstance() => _instance;

  static const String _tokenKey = 'jwt_token';
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> saveToken(String token) => _storage.write(key: _tokenKey, value: token);

  Future<String?> readToken() => _storage.read(key: _tokenKey);

  Future<void> deleteToken() => _storage.delete(key: _tokenKey);
}