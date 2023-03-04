import 'package:microhack/models/survey.dart';

import '../models/question.dart';

class AppData {
  AppData._();

  static final List<Survey> surveys = [
    Survey(
      isDone: true,
      id: '1',
      title: 'How do you feel about the current pandemic?',
      description:
          'We are conducting a survey to understand how people feel about the current pandemic.',
      questions: [
        Question(
          title: 'How do you feel about the current pandemic?',
          description:
              'We are conducting a survey to understand how people feel about the current pandemic.',
          answerType: AnswerType.choice,
          choices: [
            'I am not worried about the pandemic.',
            'I am worried about the pandemic.',
            'I am very worried about the pandemic.',
          ],
        ),
        Question(
          title: 'How do you feel about the current pandemic?',
          description:
              'We are conducting a survey to understand how people feel about the current pandemic.',
          answerType: AnswerType.text,
        ),
        Question(
          title: 'Your age?',
          description:
              'We are conducting a survey to understand how people feel about the current pandemic.',
          answerType: AnswerType.slider,
        ),
      ],
      coins: 50,
      createdAt: DateTime.now(),
    ),
    Survey(
      id: '2',
      title: 'How do you feel about the current pandemic?',
      description:
          'We are conducting a survey to understand how people feel about the current pandemic.',
      questions: [
        Question(
          title: 'How do you feel about the current pandemic?',
          description:
              'We are conducting a survey to understand how people feel about the current pandemic.',
          answerType: AnswerType.choice,
          choices: [
            'I am not worried about the pandemic.',
            'I am worried about the pandemic.',
            'I am very worried about the pandemic.',
          ],
        ),
        Question(
          title: 'How do you feel about the current pandemic?',
          description:
              'We are conducting a survey to understand how people feel about the current pandemic.',
          answerType: AnswerType.text,
        ),
        Question(
          title: 'Your age?',
          description:
              'We are conducting a survey to understand how people feel about the current pandemic.',
          answerType: AnswerType.slider,
        ),
      ],
      coins: 100,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Survey(
      id: '3',
      title: 'How do you feel about the current pandemic?',
      description:
          'We are conducting a survey to understand how people feel about the current pandemic.',
      questions: [
        Question(
          title: 'How do you feel about the current pandemic?',
          description:
              'We are conducting a survey to understand how people feel about the current pandemic.',
          answerType: AnswerType.choice,
          choices: [
            'I am not worried about the pandemic.',
            'I am worried about the pandemic.',
            'I am very worried about the pandemic.',
          ],
        ),
      ],
      coins: 100,
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
    ),
  ];
}
