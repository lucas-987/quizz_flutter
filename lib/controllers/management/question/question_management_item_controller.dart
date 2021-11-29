import 'package:flutter/material.dart';
import 'package:quizz/views/management/question/question_management_item_view.dart';
import 'package:quizz/widgets/management/question/question_management_item_widget.dart';

class QuestionManagementItemController extends State<QuestionManagementItemWidget> {

  @override
  Widget build(BuildContext context) => QuestionManagementItemView(this);

  void onTapped() {
    Navigator.of(context).pushNamed('/management/choices', arguments: widget.question);
  }
}