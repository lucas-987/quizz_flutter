import 'package:flutter/material.dart';
import 'package:quizz/controllers/game/select/game_select_quizz_item_controller.dart';
import 'package:quizz/model/quizz.dart';

class GameSelectQuizzItemWidget extends StatefulWidget {

  Quizz quizz;

  GameSelectQuizzItemWidget(this.quizz, {Key? key}) : super(key: key);

  @override
  GameSelectQuizzItemController createState() => GameSelectQuizzItemController();
}