import 'package:flutter/material.dart';
import 'package:ud2_t2_usr3498_navegacion/service/auth_service.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/exceptions/app_exception.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/session_navigation.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/auth_form_style.dart';
import 'package:ud2_t2_usr3498_navegacion/widgets/message_dialog.dart';

class WelcomeMessageButton extends StatefulWidget {
  const WelcomeMessageButton({super.key});

  @override
  State<WelcomeMessageButton> createState() => _WelcomeMessageButtonState();
}

class _WelcomeMessageButtonState extends State<WelcomeMessageButton> {
  final AuthService _auth = AuthService.getInstance();
  bool _loading = false;

  Future<void> _showWelcome() async {
    setState(() => _loading = true);
    try {
      final message = await _auth.getWelcomeMessage();
      if (!mounted) return;
      await showMessageDialog(context, title: 'Bienvenida', message: message);
    } on UnauthorizedException catch (e) {
      if (!mounted) return;
      await showMessageDialog(context, title: 'Sesión no válida', message: e.message);
      if (!mounted) return;
      await logoutAndGoToLogin(context);
    } on AppException catch (e) {
      if (!mounted) return;
      await showMessageDialog(context, title: 'Error', message: e.message);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton.icon(
        style: AuthFormStyles.primaryButton,
        onPressed: _loading ? null : _showWelcome,
        icon: _loading
            ? const SizedBox(
                height: 18,
                width: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AuthFormStyles.accent,
                ),
              )
            : const Icon(Icons.waving_hand),
        label: const Text('Mensaje de bienvenida'),
      ),
    );
  }
}