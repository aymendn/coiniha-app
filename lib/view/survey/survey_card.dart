import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:microhack/models/survey.dart';

import '../../core/app_color.dart';
import '../../core/app_methods.dart';
import '../../providers/survey.dart';

class SurveyCard extends ConsumerWidget {
  const SurveyCard({super.key, required this.survey});

  final Survey survey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: survey.isDone ? null : AppColor.secondary,
        border: Border.all(
          color: survey.isDone ? Colors.white30 : Colors.transparent,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppMethod.formattedDate(survey.createdAt),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    survey.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    survey.description,
                    style: const TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${survey.coins} Coins',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColor.white,
                      fixedSize: const Size(90, 45),
                    ),
                    onPressed: survey.isDone
                        ? null
                        : () {
                            ref
                                .read(surveyProvider.notifier)
                                .startSurvey(survey.id);
                            Navigator.of(context).pushNamed('/survey');
                          },
                    child: Text(survey.isDone ? 'Done' : 'Start'),
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
