import 'package:flutter/material.dart';
import 'package:quizz/views/management/question/add_question_form_choices_view.dart';
import 'package:quizz/widgets/management/question/add_question_form_choices_widget.dart';

import '../show_change_text_dialog.dart';

class AddQuestionFormChoicesController extends State<AddQuestionFormChoicesWidget> {

  @override
  Widget build(BuildContext context) => AddQuestionFormChoicesView(this);

  String? validateChoice(String? value) {
    if(value == null || value.isEmpty) {
      return "Field required";
    }

    return null;
  }

  void onChoiceClicked(int index) {
    if(index < 0  || index > widget.choices.length) return;
    Future<String?> dialogResult = showDialog<String?>(
        context: context,
        builder: (context) => showChangeTextDialog(context, "Choice ${index+1}", "Value", widget.choices[index])
    );

    dialogResult.then((result) {
      if(result != null && result.isNotEmpty){
        this.widget.onChoiceValueChanged(index, result);
      }
    });
  }
}