import 'package:flutter/material.dart';

class AppMethod {
  const AppMethod._();

  static String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }
    if (!email.contains('@')) {
      return 'Email is invalid';
    }
    return null;
  }

  static String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? nameValidator(String? name) {
    if (name == null || name.isEmpty) {
      return 'Name is required';
    }
    if (name.length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  static showPopUp({
    required BuildContext context,
    String? title,
    String? content,
    List<Widget>? actions,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: title != null ? Text(title) : null,
          content: content != null ? Text(content) : null,
          actions: actions ??
              [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('CLOSE'),
                ),
              ],
        );
      },
    );
  }
}


