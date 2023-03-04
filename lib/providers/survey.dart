import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:microhack/models/survey.dart';

import '../core/app_data.dart';
import '../models/question.dart';

final surveyProvider = ChangeNotifierProvider<SurveyNotifier>((ref) {
  return SurveyNotifier();
});

class SurveyNotifier extends ChangeNotifier {
  List<Survey> surveys = [...AppData.surveys];
  String? currentSurveyId;
  int? currentQuestionIndex;
  bool? isSurveyCompleted;

  double get progress {
    if (currentSurveyId == null) return 0;
    return (currentQuestionIndex! + 1) / currentSurvey!.questions.length;
  }

  get isQuestionAnswered {
    if (currentSurveyId == null) return false;
    return currentQuestion!.answer != null;
  }

  int? get currentSurveyIndex {
    if (currentSurveyId == null) return null;
    return surveys.indexWhere((survey) => survey.id == currentSurveyId);
  }

  Survey? get currentSurvey {
    if (currentSurveyId == null) return null;
    return surveys.firstWhere((survey) => survey.id == currentSurveyId);
  }

  Question? get currentQuestion {
    if (currentSurveyId == null) return null;
    return currentSurvey!.questions[currentQuestionIndex ?? 0];
  }

  bool get hasMoreQuestions {
    if (currentSurveyId == null) return false;
    return currentQuestionIndex! < currentSurvey!.questions.length - 1;
  }

  void startSurvey(String surveyId) {
    currentSurveyId = surveyId;
    currentQuestionIndex = 0;
    notifyListeners();
  }

  void previousQuestion(BuildContext context) {
    if (currentQuestionIndex! > 0) {
      currentQuestionIndex = currentQuestionIndex! - 1;
      notifyListeners();
    }
  }

  void nextQuestion(BuildContext context) {
    if (!hasMoreQuestions) {
      Navigator.of(context).pushReplacementNamed('/result');
    }
    if (hasMoreQuestions && isQuestionAnswered) {
      currentQuestionIndex = currentQuestionIndex! + 1;
      notifyListeners();
    }
  }

  void answerQuestion(String answer) {
    surveys[currentSurveyIndex!].questions[currentQuestionIndex!].answer =
        answer;

    notifyListeners();
  }

  void endSurvey() {
    currentSurveyId = null;
    currentQuestionIndex = null;
    isSurveyCompleted = null;
    notifyListeners();
  }
}
