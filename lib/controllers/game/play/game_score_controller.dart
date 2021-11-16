import 'package:flutter/material.dart';
import 'package:quizz/views/game/play/game_score_view.dart';
import 'package:quizz/widgets/game/play/game_score_widget.dart';

class GameScoreController extends State<GameScoreWidget> {
  @override
  Widget build(BuildContext context) => GameScoreView(this);

  void goToHome() {
    Navigator.of(context).pushNamed("/");
  }
}