import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
              padding: const EdgeInsets.all(16),
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
                  const Text(
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey
                    ),
                    textAlign: TextAlign.center,
                    'We were always exposed to the same parts oof our country as a community, we forget that there is truly more to Algeria than beaches.',
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Sign in with Google'),
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
