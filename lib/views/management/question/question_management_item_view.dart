import 'package:flutter/material.dart';
import 'package:quizz/controllers/management/question/question_management_item_controller.dart';
import 'package:quizz/views/widget_view.dart';
import 'package:quizz/widgets/management/question/question_management_item_widget.dart';

class QuestionManagementItemView extends WidgetView<QuestionManagementItemWidget, QuestionManagementItemController> {

  QuestionManagementItemView(QuestionManagementItemController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: Center(
              child: Text(this.widget.question.sentence)
          )
      ),
    );
  }
}