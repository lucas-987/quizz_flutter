import 'package:flutter/material.dart';
import 'package:quizz/views/game/select/game_select_quizz_view.dart';
import 'package:quizz/views/home_view.dart';
import 'package:quizz/widgets/game/select/game_select_quizz_widget.dart';
import 'package:quizz/widgets/home_widget.dart';

class GameSelectQuizzController extends State<GameSelectQuizzWidget> {

  @override
  Widget build(BuildContext context) => GameSelectQuizzView(this);
}