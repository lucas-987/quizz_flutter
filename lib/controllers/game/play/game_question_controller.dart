import 'package:flutter/material.dart';
import 'package:quizz/views/game/play/game_question_view.dart';
import 'package:quizz/widgets/game/play/game_question_widget.dart';

class GameQuestionController extends State<GameQuestionWidget> {
  @override
  Widget build(BuildContext context) => GameQuestionView(this);
}