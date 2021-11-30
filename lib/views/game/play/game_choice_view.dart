import 'package:flutter/material.dart';
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
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          childAspectRatio: (20/10),//(0.05 * (0.4 * MediaQuery.of(context).size.height) / 0.15 * (0.4 * MediaQuery.of(context).size.height)),
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            for(Choice choice in this.widget.question.choices)
              GestureDetector(
                child: Card(
                  color: Color.fromRGBO(252, 174, 63, 1),
                  child: Center(
                    child: Text(choice.value),
                  ),
                ),
                onTap: () => this.widget.onClicked(choice.value),
              )
          ],
        ),
      ),
    );
  }
}