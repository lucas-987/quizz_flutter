import 'package:flutter/material.dart';
import 'package:quizz/controllers/game/select/game_select_quizz_item_controller.dart';
import 'package:quizz/views/widget_view.dart';
import 'package:quizz/widgets/game/select/game_select_quizz_item_widget.dart';

class GameSelectQuizzItemView extends WidgetView<GameSelectQuizzItemWidget, GameSelectQuizzItemController> {

  const GameSelectQuizzItemView(GameSelectQuizzItemController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(

      title: Center(
        child: Text(state.widget.quizz.title == null ? "no title" : state.widget.quizz.title!),
      ),
      onTap: () => state.onClicked(context),
    );
  }
}