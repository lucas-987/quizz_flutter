import 'package:flutter/material.dart';
import 'package:quizz/controllers/game/play/game_choice_controller.dart';
import 'package:quizz/model/question.dart';

class GameChoiceWidget extends StatefulWidget {
  Question question;
  double? heightPercent;
  final bool? Function(String value) onClicked;
  final void Function() nextQuestion;

  GameChoiceWidget(this.question, this.onClicked, this.nextQuestion, {Key? key, double? heightPercent}) : super(key: key);

  @override
  GameChoiceController createState() => GameChoiceController();
}