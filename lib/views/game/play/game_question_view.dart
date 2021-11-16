import 'package:flutter/cupertino.dart';
import 'package:quizz/controllers/game/play/game_question_controller.dart';
import 'package:quizz/views/widget_view.dart';
import 'package:quizz/widgets/game/play/game_question_widget.dart';

class GameQuestionView extends WidgetView<GameQuestionWidget, GameQuestionController> {
  const GameQuestionView(GameQuestionController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(this.widget.question.sentence)
    );
  }
}