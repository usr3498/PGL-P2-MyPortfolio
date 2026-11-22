class AuthValidators {
  AuthValidators._();

  static final RegExp _emailRegex =
      RegExp(r'^[A-Za-z0-9._%+\-]+@[A-Za-z0-9.\-]+\.[A-Za-z]{2,}$');

  static String? fullName(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return 'El nombre completo es obligatorio';
    if (text.length < 3) return 'Introduce al menos 3 caracteres';
    return null;
  }

  static String? email(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return 'El email es obligatorio';
    if (!_emailRegex.hasMatch(text)) return 'Introduce un email válido';
    return null;
  }

  static String? strongPassword(String? value) {
    final text = value ?? '';
    if (text.isEmpty) return 'La contraseña es obligatoria';
    if (text.length < 8) return 'Mínimo 8 caracteres';
    if (text.length > 72) return 'Máximo 72 caracteres';
    if (!text.contains(RegExp(r'[A-Z]'))) return 'Incluye al menos una mayúscula';
    if (!text.contains(RegExp(r'[a-z]'))) return 'Incluye al menos una minúscula';
    if (!text.contains(RegExp(r'[0-9]'))) return 'Incluye al menos un número';
    if (!text.contains(RegExp(r'[^A-Za-z0-9]'))) {
      return 'Incluye al menos un símbolo (!@#\$%...)';
    }
    return null;
  }

  static String? requiredPassword(String? value) {
    if (value == null || value.isEmpty) return 'La contraseña es obligatoria';
    return null;
  }
}