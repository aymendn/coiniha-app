import 'package:microhack/models/question.dart';

class Survey {
  Survey({
    required this.id,
    required this.title,
    required this.description,
    required this.questions,
    required this.coins,
    required this.createdAt,
    this.isDone = false,
  });

  final String id;
  final String title;
  final String description;
  List<Question> questions;
  final int coins;
  final DateTime createdAt;
  final bool isDone;

  // copyWith

  Survey copyWith({
    String? id,
    String? title,
    String? description,
    List<Question>? questions,
    int? coins,
    DateTime? createdAt,
  }) {
    return Survey(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      questions: questions ?? this.questions,
      coins: coins ?? this.coins,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
