enum AnswerType {
  choice,
  text,
  slider,
}

class Question {
   Question({
    required this.title,
    required this.description,
    required this.answerType,
    this.choices,
     this.answer,
    this.imageUrl,

  });

  final String title;
  final String description;
  final AnswerType answerType;
  final List<String>? choices;
   String? answer;
  final String? imageUrl;

  Question copyWith({
    String? title,
    String? description,
    AnswerType? answerType,
    List<String>? choices,
    String? answer,
    String? imageUrl,
  }) {
    return Question(
      title: title ?? this.title,
      description: description ?? this.description,
      answerType: answerType ?? this.answerType,
      choices: choices ?? this.choices,
      answer: answer ?? this.answer,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
