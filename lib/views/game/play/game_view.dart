import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz/controllers/game/play/game_controller.dart';
import 'package:quizz/model/choice.dart';
import 'package:quizz/views/widget_view.dart';
import 'package:quizz/widgets/game/play/game_choice_widget.dart';
import 'package:quizz/widgets/game/play/game_question_widget.dart';
import 'package:quizz/widgets/game/play/game_widget.dart';

class GameView extends WidgetView<GameWidget, GameController> {
  const GameView(GameController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(252, 64, 80, 1),
        centerTitle: true,
        foregroundColor: Colors.black,
        title: Text(this.state.widget.quizz.title == null ? "" : state.widget.quizz.title!),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GameQuestionWidget(
              this.widget.quizz.questions[this.state.currentQuestionIndex],
              this.state.currentQuestionIndex,
              this.widget.quizz.questions.length,
              this.state.nextButtonClicked,
              this.state.showAnwserButtonClicked
            ),
            const SizedBox(height: 20),
            GameChoiceWidget(
              this.widget.quizz.questions[this.state.currentQuestionIndex],
              this.state.checkAnwser,
              this.state.nextButtonClicked,
              heightPercent: 0.05,
            ),
            const SizedBox(height: 20),
          ],
        )
      ),
    );
  }
}