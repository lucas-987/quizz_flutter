import 'package:flutter/material.dart';
import 'package:quizz/controllers/game/play/game_score_controller.dart';
import 'package:quizz/views/widget_view.dart';
import 'package:quizz/widgets/game/play/game_score_widget.dart';

class GameScoreView extends WidgetView<GameScoreWidget, GameScoreController> {
  GameScoreView(GameScoreController state, {Key? key}) : super(state, key: key);

  Widget detail() {
    // TODO make a custom widget out of this function
    return Expanded(
      child: ListView(
        children: [
          for(int i=0; i< widget.nbQuestions; i++)
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Question ${i}:",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Flexible(
                    fit: FlexFit.loose,
                      child: Text(
                        widget.userAnswers != null ? widget.userAnswers![i]?.item1 ?? " - " : " - ",
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black
                        ),
                        textAlign: TextAlign.left,
                        //overflow: TextOverflow.ellipsis,
                    )
                  ),
                  const SizedBox(width: 10,),
                  Icon(
                    (widget.userAnswers != null && widget.userAnswers![i] != null && widget.userAnswers![i]!.item2) ? Icons.check : Icons.clear,
                    color: (widget.userAnswers != null && widget.userAnswers![i] != null && widget.userAnswers![i]!.item2) ? Colors.green : Colors.red,
                  )
                ],
              ),
            )
        ],
      ),
    );
  }

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
            left: ((this.widget.userAnswers == null || widget.nbQuestions < 1) ? 0.125 : 0.05) * MediaQuery.of(context).size.width,
            top: ((this.widget.userAnswers == null || widget.nbQuestions < 1) ? 0.3 : 0.2) * MediaQuery.of(context).size.height,
            child: Container(
              height: ((this.widget.userAnswers == null || widget.nbQuestions < 1) ? 0.4 : 0.6) * MediaQuery.of(context).size.height,
              width: ((this.widget.userAnswers == null || widget.nbQuestions < 1) ? 0.75 : 0.9) * MediaQuery.of(context).size.width,
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
                    const SizedBox(height: 20),
                    Text(
                      this.widget.score.toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 50
                      ),
                    ),
                    (this.widget.userAnswers == null || widget.nbQuestions < 1) ? Text("hahahahaha") : detail(),//SizedBox.shrink(),
                    const SizedBox(height: 20),
                    TextButton(
                        onPressed: () => this.state.goToHome(),
                        child: const Icon(
                          Icons.home,
                          size: 40,
                        )
                    ),
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