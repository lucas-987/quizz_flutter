import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizz/controllers/game/play/game_question_controller.dart';
import 'package:quizz/views/widget_view.dart';
import 'package:quizz/widgets/game/play/game_question_widget.dart';
import 'dart:math' as math;

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
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(64, 64, 64, 0.8),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(-3, 5)
                ),
              ]
          ),
          child: SizedBox(
            height: 0.25 * MediaQuery.of(context).size.height,
            width: 0.9 * MediaQuery.of(context).size.width,
          ),
        ),

        Stack(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          alignment: Alignment.centerRight,
          children: [
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Color.fromRGBO(169, 204, 253, 1),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(169, 204, 253, 1),
                      Color.fromRGBO(219, 233, 254, 1),
                    ],
                  ),
              ),
              child: SizedBox(
                height: 0.25 * MediaQuery.of(context).size.height,
                width: 0.9 * MediaQuery.of(context).size.width,
              ),
            ),

            Positioned(
              right: -0.25 * 0.9 * MediaQuery.of(context).size.width,
              top: -0.25 * 0.25 * MediaQuery.of(context).size.height,
              child: Container(
                height: 0.25 * MediaQuery.of(context).size.height,
                width: 0.25 * MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(169, 204, 253, 0.5),
                      Color.fromRGBO(219, 233, 254, 0.5),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

        Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: SizedBox(
            height: 0.25 * MediaQuery.of(context).size.height,
            width: 0.9 * MediaQuery.of(context).size.width,
            child: Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Text(
                  this.widget.question.sentence,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400
                  ),
                  textAlign: TextAlign.center,
                ),
              )
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
          bottom: 0,
          left: 0.25 * 0.9 * MediaQuery.of(context).size.width,
          child: IconButton(
            onPressed: () => this.widget.showAnswerClicked(),
            icon: const Icon(
              Icons.help,
              size: 35,
              color: Colors.black,
            ),
          ),
        ),

        Positioned(
          bottom: 0,
          right: 0.25 * 0.9 * MediaQuery.of(context).size.width,
          child: IconButton(
            onPressed: () => this.widget.nextClicked(),
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 35,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}