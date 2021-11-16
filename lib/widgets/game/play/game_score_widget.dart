import 'package:flutter/material.dart';
import 'package:quizz/controllers/game/play/game_score_controller.dart';

class GameScoreWidget extends StatefulWidget {
  int score;

  GameScoreWidget(this.score, {Key? key}) : super(key: key);

  @override
  GameScoreController createState() => GameScoreController();
}