import 'package:flutter/material.dart';
import 'package:ud2_t2_usr3498_navegacion/service/auth_service.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/exceptions/app_exception.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/App_screens_dark.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/auth_form_style.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/validators/auth_validator.dart';
import 'package:ud2_t2_usr3498_navegacion/widgets/auth_text_field.dart';
import 'package:ud2_t2_usr3498_navegacion/widgets/message_dialog.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthService _auth = AuthService.getInstance();

  bool _loading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;
    FocusScope.of(context).unfocus();
    setState(() => _loading = true);

    try {
      final message = await _auth.register(
        fullName: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
      if (!mounted) return;
      await showMessageDialog(context, title: 'Registro completado', message: message);
      if (!mounted) return;
      Navigator.of(context).pop();
    } on AppException catch (e) {
      if (!mounted) return;
      await showMessageDialog(context, title: 'Error', message: e.message);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPortfolioScreensStyles.background,
      appBar: AppBar(
        backgroundColor: AppPortfolioScreensStyles.background,
        foregroundColor: AppPortfolioScreensStyles.textColor,
        title: const Text('Crear cuenta'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AuthTextField(
                      controller: _nameController,
                      label: 'Nombre completo',
                      icon: Icons.person,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                      validator: AuthValidators.fullName,
                    ),
                    const SizedBox(height: 16),
                    AuthTextField(
                      controller: _emailController,
                      label: 'Email',
                      icon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: AuthValidators.email,
                    ),
                    const SizedBox(height: 16),
                    AuthTextField(
                      controller: _passwordController,
                      label: 'Contraseña',
                      icon: Icons.lock,
                      isPassword: true,
                      helperText:
                          'Mínimo 8 caracteres, con mayúscula, minúscula, número y símbolo',
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _register(),
                      validator: AuthValidators.strongPassword,
                    ),
                    const SizedBox(height: 24),
                    FilledButton(
                      style: AuthFormStyles.primaryButton,
                      onPressed: _loading ? null : _register,
                      child: _loading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AuthFormStyles.accent,
                              ),
                            )
                          : const Text('Registrarse'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}