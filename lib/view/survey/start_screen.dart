import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:microhack/view/shared/custom_button.dart';

import '../../core/app_color.dart';
import '../../providers/survey.dart';

class StartScreen extends ConsumerWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final survey = ref.watch(surveyProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'COINIHA',
          style: TextStyle(
            color: AppColor.secondaryBright,
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              survey.currentSurvey?.title ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
            Text(
              survey.currentSurvey?.description ?? '',
              textAlign: TextAlign.center,
            ),
            Image.asset('assets/images/woman.png'),
            const Spacer(),
            CustomButton(
              child: const Text('Get Started!'),
              onPressed: () {
                Navigator.of(context).pushNamed('/survey');
              },
            ),
          ],
        ),
      ),
    );
  }
}
