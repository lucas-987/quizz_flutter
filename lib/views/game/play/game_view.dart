import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz/controllers/game/play/game_controller.dart';
import 'package:quizz/views/widget_view.dart';
import 'package:quizz/widgets/game/play/game_widget.dart';

class GameView extends WidgetView<GameWidget, GameController> {
  const GameView(GameController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(this.state.widget.quizz.title == null ? "" : state.widget.quizz.title!),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(this.widget.quizz.questions[this.state.currentQuestionIndex].sentence),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () => this.state.nextButtonClicked(), child: Text("next")),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () => this.state.checkAnwser("true"), child: Text("true")),
                SizedBox(width: 20),
                ElevatedButton(onPressed: () => this.state.checkAnwser("false"), child: Text("false"))
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () => this.state.showAnwserButtonClicked(), child: Text("show answer"))
          ],
        )
      ),
    );
  }
}