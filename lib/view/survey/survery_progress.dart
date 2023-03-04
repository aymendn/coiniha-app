import 'package:flutter/material.dart';
import 'package:microhack/core/app_color.dart';

class SurveyProgress extends StatelessWidget {
  const SurveyProgress({super.key, required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(5),
      child: AnimatedFractionallySizedBox(
        duration: const Duration(milliseconds: 500),
        alignment: Alignment.centerLeft,
        widthFactor: progress,
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.secondaryBright,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
