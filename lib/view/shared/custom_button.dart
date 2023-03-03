import 'package:flutter/material.dart';
import 'package:microhack/core/app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.child,
    this.onPressed,
    this.color = AppColor.primary,
    this.borderColor,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final Color color;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: color,
        foregroundColor: borderColor ?? AppColor.white,
        minimumSize: const Size.fromHeight(60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        // add border
        side: BorderSide(
          color: borderColor ?? Colors.transparent,
          width: 2,
        ),
      ),
      child: child,
    );
  }
}
