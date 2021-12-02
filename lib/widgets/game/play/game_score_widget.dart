import 'package:flutter/material.dart';
import 'package:quizz/controllers/game/play/game_score_controller.dart';
import 'package:quizz/tools/Tuple.dart';

class GameScoreWidget extends StatefulWidget {
  int score;
  Map<int, Tuple<String, bool>?>? userAnswers;
  int nbQuestions = 0;

  GameScoreWidget(this.score, {Key? key, this.userAnswers, int? nbQuestions}) : super(key: key) {
    if(nbQuestions != null && nbQuestions > 0) this.nbQuestions = nbQuestions;
  }

  @override
  GameScoreController createState() => GameScoreController();
}