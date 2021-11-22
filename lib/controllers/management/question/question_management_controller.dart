import 'package:flutter/material.dart';
import 'package:quizz/model/question.dart';
import 'package:quizz/model/quizz.dart';
import 'package:quizz/views/management/question/question_management_view.dart';
import 'package:quizz/widgets/management/question/question_management_widget.dart';

class QuestionManagementController extends State<QuestionManagementWidget> {

  @override
  Widget build(BuildContext context) => QuestionManagementView(this);

  void onReorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final Question question = this.widget.quizz.questions.removeAt(oldIndex);
    this.widget.quizz.questions.insert(newIndex, question);
  }

  void onDismissed(direction, int index) {
    this.widget.quizz.questions.removeAt(index);
  }

  void onAddFABClicked() {
    Navigator.of(context).pushNamed("/management/questions/add", arguments: this.widget.quizz);
  }
}