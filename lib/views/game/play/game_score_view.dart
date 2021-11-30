import 'package:flutter/material.dart';
import 'package:quizz/controllers/game/play/game_score_controller.dart';
import 'package:quizz/views/widget_view.dart';
import 'package:quizz/widgets/game/play/game_score_widget.dart';

class GameScoreView extends WidgetView<GameScoreWidget, GameScoreController> {
  const GameScoreView(GameScoreController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.8, 0.0),
                colors: [
                  Color.fromRGBO(252, 64, 80, 1),
                  Color.fromRGBO(252, 242, 63, 1),
                ],
                tileMode: TileMode.repeated
              )
            ),
            height: 0.45 * MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: const SizedBox(),
          ),

          Positioned(
            left: 0.125 * MediaQuery.of(context).size.width,
            top: 0.3 * MediaQuery.of(context).size.height,
            child: Container(
              height: 0.4 * MediaQuery.of(context).size.height,
              width: 0.75 * MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(92, 92, 92, 0.6),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 5)
                    ),
                  ]
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text(
                        "Score",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 50
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      this.widget.score.toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 50
                      ),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                        onPressed: () => this.state.goToHome(),
                        child: const Text(
                            "Home",
                            style: TextStyle(
                                fontSize: 40
                            )
                        )
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

/*

 */