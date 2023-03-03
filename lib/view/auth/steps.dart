import 'package:flutter/material.dart';
import 'package:microhack/core/app_color.dart';

class Steps extends StatelessWidget {
  const Steps({
    super.key,
    required this.currentSteps,
    this.stepsCount = 3,
  });

  final int currentSteps;
  final int stepsCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        stepsCount,
        (index) {
          final isCurrentStep = index == currentSteps;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 2),
            width: isCurrentStep ? 24 : 6,
            height: 6,
            decoration: BoxDecoration(
              color: isCurrentStep ? AppColor.secondary : AppColor.grey,
              borderRadius: BorderRadius.circular(3),
            ),
          );
        },
      ),
    );
  }
}
