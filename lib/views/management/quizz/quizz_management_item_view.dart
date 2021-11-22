import 'package:flutter/material.dart';
import 'package:quizz/controllers/management/quizz/quizz_management_item_controller.dart';
import 'package:quizz/views/widget_view.dart';
import 'package:quizz/widgets/management/quizz/quizz_management_item_widget.dart';

class QuizzManagementItemView extends WidgetView<QuizzManagementItemWidget, QuizzManagementItemController> {

  QuizzManagementItemView(QuizzManagementItemController state, {Key? key}): super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Center(
          child: Text(this.widget.quizz.title == null ? "no title" : this.widget.quizz.title!)
        ),
        onTap: () => this.state.onTap(this.widget.quizz),
      ),
    );
  }
}