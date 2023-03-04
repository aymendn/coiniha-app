import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:microhack/providers/survey.dart';
import 'package:microhack/view/survey/answer.dart';
import 'package:microhack/view/survey/survery_progress.dart';

class SurveyScreen extends HookConsumerWidget {
  const SurveyScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final survey = ref.watch(surveyProvider);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                children: [
                  SurveyProgress(progress: survey.progress),
                  const SizedBox(height: 24),
                  Text(
                    survey.currentQuestion?.title ?? '',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(survey.currentQuestion?.description ?? ''),
                  const SizedBox(height: 16),
                  Answer(survey.currentQuestion!),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => ref
                        .read(surveyProvider.notifier)
                        .previousQuestion(context),
                    icon: const Icon(Icons.arrow_back),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white24,
                      padding: const EdgeInsets.all(16),
                      elevation: 0,
                    ),
                  ),
                  FilledButton(
                    onPressed: () =>
                        ref.read(surveyProvider.notifier).nextQuestion(context),
                    style: FilledButton.styleFrom(
                      backgroundColor: survey.isQuestionAnswered
                          ? Colors.white30
                          : Colors.white10,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      elevation: 0,
                    ),
                    child: const Icon(Icons.arrow_forward),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
