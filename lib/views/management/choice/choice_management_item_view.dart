import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quizz/controllers/management/choice/choice_management_item_controller.dart';
import 'package:quizz/views/widget_view.dart';
import 'package:quizz/widgets/management/choice/choice_management_item_widget.dart';

class ChoiceManagementItemView extends WidgetView<ChoiceManagementItemWidget, ChoiceManagementItemController> {

  ChoiceManagementItemView(ChoiceManagementItemController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: GestureDetector(
          child: Center(
              child: Text(this.widget.choice.value)
          ),
          onTap: () => this.widget.onTapped(widget.choice),
        ),
        trailing: Checkbox(
          value: widget.isRightChoice,
          onChanged: (selected) {
            if(widget.isRightChoice) return;
            else this.widget.onSelect(widget.choice);
          },
        ),
        onTap: () => this.widget.onTapped(widget.choice),
      ),
    );
  }
}