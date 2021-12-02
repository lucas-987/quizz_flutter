import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quizz/controllers/game/play/game_choice_controller.dart';
import 'package:quizz/model/choice.dart';
import 'package:quizz/views/widget_view.dart';
import 'package:quizz/widgets/game/play/game_choice_widget.dart';

class GameChoiceView extends WidgetView<GameChoiceWidget, GameChoiceController> {

  GameChoiceView(GameChoiceController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (widget.heightPercent == null ? 0.4 : widget.heightPercent! ) * MediaQuery.of(context).size.height,
      child: Expanded(
        child: GridView.count(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          childAspectRatio: (20/10),//(0.05 * (0.4 * MediaQuery.of(context).size.height) / 0.15 * (0.4 * MediaQuery.of(context).size.height)),
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            for(int i=0; i < this.widget.question.choices.length; i++)
              GestureDetector(
                child: Container(
                  decoration:  BoxDecoration(
                    color: i == state.rightChoiceIndex ? Colors.lightGreen : (i == state.wrongChoiceIndex ? Colors.red : Color.fromRGBO(252, 174, 63, 1)),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(92, 92, 92, 0.8),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(-2, 2)
                      ),
                    ]
                  ),
                  child: Center(
                    child: Text(
                      widget.question.choices[i].value,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  if(!state.clickDisabled)
                    state.onChoiceSubmitt(i);
                },
              )
          ],
        ),
      ),
    );
  }
}