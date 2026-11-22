import 'package:flutter/material.dart';
import 'package:ud2_t2_usr3498_navegacion/screens/register_screen.dart';
import 'package:ud2_t2_usr3498_navegacion/screens/welcome_screen.dart';
import 'package:ud2_t2_usr3498_navegacion/service/auth_service.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/exceptions/app_exception.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/App_screens_dark.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/auth_form_style.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/validators/auth_validator.dart';
import 'package:ud2_t2_usr3498_navegacion/widgets/auth_text_field.dart';
import 'package:ud2_t2_usr3498_navegacion/widgets/message_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthService _auth = AuthService.getInstance();

  bool _checkingSession = true;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _checkSession();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _checkSession() async {
    final valid = await _auth.hasValidSession();
    if (!mounted) return;
    if (valid) {
      _goToWelcome();
    } else {
      setState(() => _checkingSession = false);
    }
  }

  void _goToWelcome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(builder: (_) => const WelcomeScreen()),
    );
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;
    FocusScope.of(context).unfocus();
    setState(() => _loading = true);

    try {
      final response = await _auth.login(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
      if (!mounted) return;
      await showMessageDialog(context, title: 'Inicio de sesión', message: response.message);
      if (!mounted) return;
      _goToWelcome();
    } on AppException catch (e) {
      if (!mounted) return;
      await showMessageDialog(context, title: 'Error', message: e.message);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_checkingSession) {
      return const Scaffold(
        backgroundColor: AppPortfolioScreensStyles.background,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(color: AuthFormStyles.accent),
                SizedBox(height: 20),
                Text(
                  'Comprobando sesión...\n'
                  'Si el servidor estaba dormido puede tardar hasta 60 segundos.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppPortfolioScreensStyles.textColor),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppPortfolioScreensStyles.background,
      appBar: AppBar(
        backgroundColor: AppPortfolioScreensStyles.background,
        foregroundColor: AppPortfolioScreensStyles.textColor,
        title: const Text('Iniciar sesión'),
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
                    const Text(
                      'CANARIAS +',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppPortfolioScreensStyles.textColor,
                      ),
                    ),
                    const SizedBox(height: 32),
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
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _login(),
                      validator: AuthValidators.requiredPassword,
                    ),
                    const SizedBox(height: 24),
                    FilledButton(
                      style: AuthFormStyles.primaryButton,
                      onPressed: _loading ? null : _login,
                      child: _loading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AuthFormStyles.accent,
                              ),
                            )
                          : const Text('Iniciar sesión'),
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton(
                      style: AuthFormStyles.secondaryButton,
                      onPressed: _loading
                          ? null
                          : () => Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                  builder: (_) => const RegisterScreen(),
                                ),
                              ),
                      child: const Text('Crear una cuenta'),
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