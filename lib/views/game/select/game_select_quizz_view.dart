import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz/application_state/all_quizzes.dart';
import 'package:quizz/controllers/game/select/game_select_quizz_controller.dart';
import 'package:quizz/views/widget_view.dart';
import 'package:quizz/widgets/game/select/game_select_quizz_item_widget.dart';
import 'package:quizz/widgets/game/select/game_select_quizz_widget.dart';

class GameSelectQuizzView extends WidgetView<GameSelectQuizzWidget, GameSelectQuizzController> {

  const GameSelectQuizzView(GameSelectQuizzController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {

    return Consumer<AllQuizzes>(
      builder: (context, allQuizzes, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Select a quizz"),
        ),
        body: Center(
          child: ListView.separated(
              itemBuilder: (context, int index) => GameSelectQuizzItemWidget(allQuizzes.quizzes[index]),
              separatorBuilder: (context, int index) => SizedBox(height: 20),
              itemCount: allQuizzes.quizzes.length)
        ),
      ),
    );
  }

}