import 'package:flutter/material.dart';
import 'package:quizz/model/choice.dart';
import 'package:quizz/model/quizz.dart';
import 'package:quizz/model/question.dart';
import 'package:quizz/db/quizz_database.dart';

class AllQuizzes with ChangeNotifier {
  List<Quizz> quizzes = [];

  AllQuizzes() {
    init();
  }

  init() {
    QuizzDatabase.instance.getAllQuizzes().then((value) {
      quizzes.addAll(value);
      notifyListeners();
    });
  }

  Future<Quizz> createQuizz(String title) async {
    Quizz newQuizz = Quizz(title);
    Quizz createdQuizz = await QuizzDatabase.instance.createQuizz(newQuizz);
    quizzes.add(createdQuizz);

    notifyListeners();
    return newQuizz;
  }

  Future<int> deleteQuizz(Quizz quizz) async {
    int deletedQuizzId = await QuizzDatabase.instance.deleteQuizz(quizz);
    for(int i=0; i<quizzes.length; i++) {
      if(quizzes[i].id == quizz.id) {
        quizzes.removeAt(i);
        break;
      }
    }
    notifyListeners();
    return deletedQuizzId;
  }

  Future<int> updateQuizz(Quizz quizz) async {
    int updatedQuizzId = await QuizzDatabase.instance.updateQuizz(quizz);

    for(int i = 0; i<quizzes.length; i++) {
      if(quizzes[i].id == quizz.id) {
        quizzes[i] == quizz;
      }
    }
    notifyListeners();

    return updatedQuizzId;
  }

  Future<Question> addQuestion(Quizz quizz, Question question) async {

    Question createdQuestion = await QuizzDatabase.instance.createQuestion(question);
    quizz.questions.add(question);

    notifyListeners();
    return createdQuestion;
  }

  Future<int> deleteQuestion(Question question) async {
    int deletedQuestionId = await QuizzDatabase.instance.deleteQuestion(question);

    for(int i = 0; i< quizzes.length; i++) {
      if(quizzes[i].id == question.quizzId) {
        for(int j=0; j<quizzes[i].questions.length; j++) {
          if(quizzes[i].questions[j].id == question.id) {
            quizzes[i].questions.removeAt(j);
          }
        }
      }
    }
    notifyListeners();

    return deletedQuestionId;
  }

  Future<int> updateQuestion(Question question) async {
    int updatedQuestionId = await QuizzDatabase.instance.updateQuestion(question);

    for(Choice choice in question.choices) {
      int updatedChoiceId = await updateChoice(choice);
    }

    for(int i = 0; i< quizzes.length; i++) {
      if(quizzes[i].id == question.quizzId) {
        for(int j=0; j<quizzes[i].questions.length; j++) {
          if(quizzes[i].questions[j].id == question.id) {
            quizzes[i].questions[j] = question;
          }
        }
      }
    }

    notifyListeners();
    return updatedQuestionId;
  }

  Future<int> updateChoice(Choice choice) async {
    return -1;
  }
}