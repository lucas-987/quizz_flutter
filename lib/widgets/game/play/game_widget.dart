import 'package:flutter/material.dart';
import 'package:quizz/controllers/game/play/game_controller.dart';
import 'package:quizz/model/quizz.dart';

class GameWidget extends StatefulWidget {

  Quizz quizz;

  GameWidget(this.quizz, {Key? key}) : super(key: key);

  @override
  GameController createState() => GameController();
}