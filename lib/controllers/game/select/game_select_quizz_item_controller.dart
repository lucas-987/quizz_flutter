import 'package:flutter/material.dart';
import 'package:quizz/views/game/select/game_select_quizz_item_view.dart';
import 'package:quizz/widgets/game/select/game_select_quizz_item_widget.dart';

class GameSelectQuizzItemController extends State<GameSelectQuizzItemWidget> {

  @override
  Widget build(BuildContext context) => GameSelectQuizzItemView(this);

  void onClicked(BuildContext context) {
    Navigator.of(context).pushNamed("/game/play", arguments: this.widget.quizz);
  }
}