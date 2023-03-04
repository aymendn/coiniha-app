import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:microhack/view/survey/survey_card.dart';

import '../../core/app_data.dart';

class SurveysScreen extends ConsumerWidget {
  const SurveysScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Surveys'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: AppData.surveys.length,
        itemBuilder: (BuildContext context, int index) {
          return SurveyCard(survey: AppData.surveys[index]);
        },
      ),
    );
  }
}
