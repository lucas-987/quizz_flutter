import 'package:flutter/material.dart';
import 'package:quizz/controllers/game/play/game_score_controller.dart';
import 'package:quizz/views/widget_view.dart';
import 'package:quizz/widgets/game/play/game_score_widget.dart';

class GameScoreView extends WidgetView<GameScoreWidget, GameScoreController> {
  const GameScoreView(GameScoreController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(this.widget.score.toString()),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () => this.state.goToHome(),
                child: Text("Home")
            )
          ],
        ),
      ),
    );
  }
}