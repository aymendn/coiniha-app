import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:microhack/core/app_methods.dart';
import 'package:microhack/models/question.dart';

import '../../core/app_color.dart';
import '../../providers/survey.dart';

class Answer extends HookConsumerWidget {
  const Answer(this.question, {super.key});

  final Question question;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<String?> answer = useState(null);
    final slideValue = useState(0.0);
    final answerController = useTextEditingController();
    if (question.answerType == AnswerType.text) {
      return TextFormField(
        controller: answerController,
        onChanged: (value) {
          ref.read(surveyProvider.notifier).answerQuestion(value);
        },
        decoration: InputDecoration(
          label: const Text('Answer'),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColor.primary.withOpacity(0.7),
              width: 2,
            ),
          ),
        ),
        validator: AppMethod.answerValidator,
      );
    }

    if (question.answerType == AnswerType.choice) {
      return Column(
        children: [
          for (final choice in question.choices!)
            Card(
              color: answer.value == choice
                  ? AppColor.white
                  : AppColor.white.withOpacity(0.85),
              child: RadioListTile<String>(
                title: Text(
                  choice,
                  style: TextStyle(
                    color:
                        answer.value == choice ? Colors.black : Colors.black87,
                  ),
                ),
                value: choice,
                groupValue: answer.value,
                onChanged: (value) {
                  ref.read(surveyProvider.notifier).answerQuestion(value ?? '');
                  answer.value = value;
                },
              ),
            ),
        ],
      );
    }

    return Slider(
      min: 0,
      max: 100,
      divisions: 50,
      value: slideValue.value,
      onChanged: (value) {
        slideValue.value = value;
      },
      onChangeEnd: (value) => ref
          .read(surveyProvider.notifier)
          .answerQuestion(value.round().toString()),
      label: '${slideValue.value.round()}',
    );
  }
}
