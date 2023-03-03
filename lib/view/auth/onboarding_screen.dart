import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:microhack/view/shared/custom_button.dart';

import 'steps.dart';

class OnboardingScreen extends HookConsumerWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Container(color: Colors.red),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              child: Column(
                children: [
                  const Text(
                    'Receive gifts while having fun',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                    textAlign: TextAlign.center,
                    'We were always exposed to the same parts oof our country as a community, we forget that there is truly more to Algeria than beaches.',
                  ),
                  const SizedBox(height: 12),
                  const Steps(
                    currentSteps: 0,
                    stepsCount: 3,
                  ),
                  const Spacer(),
                  CustomButton(
                    onPressed: () {},
                    text: 'Sign in with Google',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
