import 'package:flutter/material.dart';
import 'package:quizz/controllers/game/play/game_question_controller.dart';
import 'package:quizz/views/widget_view.dart';
import 'package:quizz/widgets/game/play/game_question_widget.dart';

class GameQuestionView extends WidgetView<GameQuestionWidget, GameQuestionController> {
  const GameQuestionView(GameQuestionController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: const Color.fromRGBO(132, 183, 253, 1)
          ),
          child: SizedBox(
            height: 0.2 * MediaQuery.of(context).size.height,
            width: 0.9 * MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                this.widget.question.sentence,
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),
          ),
        ),

        Positioned(
          top: -0.02 * MediaQuery.of(context).size.height,
          child: Container(
            padding: EdgeInsets.fromLTRB(0.02 * 0.2 * MediaQuery.of(context).size.width, 0.02 * 0.05 * MediaQuery.of(context).size.height, 0.02 * 0.2 * MediaQuery.of(context).size.width, 0.02 * 0.05 * MediaQuery.of(context).size.height),
            height: 0.05 * MediaQuery.of(context).size.height,
            width: 0.2 * MediaQuery.of(context).size.width,
            color: const Color.fromRGBO(255, 0, 0, 1),
            child: Card(
              color: const Color.fromRGBO(252, 174, 63, 1),
              child: Center(
                child: Text("${this.widget.currentQuestionNb + 1} / ${this.widget.nbQuestions}"),
              ),
            ),
          ),
        ),

        Positioned(
          bottom: -5,
          left: 0.25 * 0.9 * MediaQuery.of(context).size.width,
          child: IconButton(
            onPressed: () => this.widget.showAnswerClicked(),
            icon: Icon(
              Icons.help
            ),
          ),
        ),

        Positioned(
          bottom: -5,
          right: 0.25 * 0.9 * MediaQuery.of(context).size.width,
          child: IconButton(
            onPressed: () => this.widget.nextClicked(),
            icon: Icon(
                Icons.arrow_forward_ios
            ),
          ),
        ),
      ],
    );
  }
}