import 'package:flutter/material.dart';
import 'package:quizz/controllers/game/play/game_question_controller.dart';
import 'package:quizz/model/question.dart';

class GameQuestionWidget extends StatefulWidget {
  Question question;
  int currentQuestionNb;
  int nbQuestions;

  void Function() nextClicked;
  void Function() showAnswerClicked;

  GameQuestionWidget(this.question, this.currentQuestionNb, this.nbQuestions, this.nextClicked, this.showAnswerClicked, {Key? key}) : super(key: key);

  @override
  GameQuestionController createState() => GameQuestionController();
}