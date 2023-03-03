import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/app_color.dart';

class CustomTextFormField extends HookConsumerWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
     this.validator,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isObscure = useState(true);
    return TextFormField(
      obscureText: obscureText && isObscure.value,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: obscureText
            ? IconButton(
                icon: Icon(
                  isObscure.value ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  isObscure.value = !isObscure.value;
                },
              )
            : null,
        label: Text(label),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColor.primary.withOpacity(0.7),
            width: 2,
          ),
        ),
      ),
      validator: validator,
    );
  }
}
