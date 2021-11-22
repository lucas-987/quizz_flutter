import 'package:flutter/material.dart';
import 'package:quizz/views/management/question/add_question_form_choices_view.dart';
import 'package:quizz/widgets/management/question/add_question_form_choices_widget.dart';

class AddQuestionFormChoicesController extends State<AddQuestionFormChoicesWidget> {

  @override
  Widget build(BuildContext context) => AddQuestionFormChoicesView(this);

  String? validateChoice(String? value) {
    if(value == null || value.isEmpty) {
      return "Field required";
    }

    return null;
  }
}