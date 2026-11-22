import 'package:flutter/material.dart';
import 'package:ud2_t2_usr3498_navegacion/screens/login_screen.dart';
import 'package:ud2_t2_usr3498_navegacion/service/auth_service.dart';

Future<void> logoutAndGoToLogin(BuildContext context) async {
  final navigator = Navigator.of(context);
  await AuthService.getInstance().logout();
  navigator.pushAndRemoveUntil(
    MaterialPageRoute<void>(builder: (_) => const LoginScreen()),
    (route) => false,
  );
}