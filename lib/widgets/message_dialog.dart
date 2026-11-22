import 'package:flutter/material.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/App_screens_dark.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/auth_form_style.dart';

Future<void> showMessageDialog(
  BuildContext context, {
  required String title,
  required String message,
}) {
  return showDialog<void>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      backgroundColor: AppPortfolioScreensStyles.background,
      title: Text(
        title,
        style: const TextStyle(color: AppPortfolioScreensStyles.textColor),
      ),
      content: Text(
        message,
        style: const TextStyle(color: AppPortfolioScreensStyles.textColor),
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(foregroundColor: AuthFormStyles.accent),
          onPressed: () => Navigator.of(dialogContext).pop(),
          child: const Text('Aceptar'),
        ),
      ],
    ),
  );
}