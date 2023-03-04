import 'package:microhack/models/product.dart';
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

  static final List<Product> products = [
    Product(
      id: '1',
      title: 'COINIHA T-Shirt',
      price: 30,
      imageUrl: 'assets/images/image_35.png',
    ),
    Product(
        id: '2',
        title: 'COINIHA Cap',
        price: 20,
        imageUrl: 'assets/images/image_35.png'),
    Product(
      id: '3',
      title: 'COINIHA Stickers',
      price: 10,
      imageUrl: 'assets/images/image_35.png',
    ),
    Product(
      id: '4',
      title: 'COINIHA Mystery Box',
      price: 99,
      imageUrl: 'assets/images/image_35.png',
    ),
    Product(
      id: '5',
      title: 'Djezzy T-Shirt',
      price: 100,
      imageUrl: 'assets/images/image_35.png',
    ),
    Product(
      id: '6',
      title: 'Djezzy Cap',
      price: 50,
      imageUrl: 'assets/images/image_35.png',
    ),
    Product(
      id: '7',
      title: 'Ooredo Stickers',
      price: 30,
      imageUrl: 'assets/images/image_35.png',
    ),
  ];
}
