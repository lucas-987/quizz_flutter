import 'package:flutter/material.dart';
import 'package:quizz/controllers/game/play/game_choice_controller.dart';
import 'package:quizz/model/question.dart';

class GameChoiceWidget extends StatefulWidget {
  Question question;
  double? heightPercent;
  final void Function(String value) onClicked;

  GameChoiceWidget(this.question, this.onClicked, {Key? key, double? heightPercent}) : super(key: key);

  @override
  GameChoiceController createState() => GameChoiceController();
}