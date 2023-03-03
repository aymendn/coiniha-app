import 'package:flutter/material.dart';
import 'package:microhack/core/app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.child, this.onPressed});

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.white,
        minimumSize: const Size.fromHeight(60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: child,
    );
  }
}
