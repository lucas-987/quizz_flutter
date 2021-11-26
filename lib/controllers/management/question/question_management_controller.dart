import 'package:flutter/material.dart';
import 'package:quizz/application_state/all_quizzes.dart';
import 'package:quizz/model/question.dart';
import 'package:quizz/model/quizz.dart';
import 'package:quizz/views/management/question/question_management_view.dart';
import 'package:quizz/widgets/management/question/question_management_widget.dart';
import 'package:quizz/controllers/management/show_change_title_dialog.dart';

class QuestionManagementController extends State<QuestionManagementWidget> {

  @override
  Widget build(BuildContext context) => QuestionManagementView(this);

  String? newQuizzName;

  void showChangeQuizzTitleDialog(AllQuizzes allQuizzes) {
    Future<String?> dialogResult = showDialog<String?>(
      context: context,
      builder: (context) => showChangeTextDialog(context, "Change quizz title", "Title", newQuizzName ?? widget.quizz.title)
    );

    dialogResult.then((result) {
      if(result != null && result.isNotEmpty){
        setState(() {
          newQuizzName = result;
        });
        widget.quizz.title = result;
        allQuizzes.updateQuizz(widget.quizz);
      }
    });
  }

  void onReorder(int oldIndex, int newIndex, AllQuizzes allQuizzes) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final Question question = this.widget.quizz.questions.removeAt(oldIndex);
    this.widget.quizz.questions.insert(newIndex, question);

    for(int i = 0; i<widget.quizz.questions.length; i++) {
      Question question = widget.quizz.questions[i];

      question.order = i;
      allQuizzes.updateQuestion(question);
    }
  }

  void onDismissed(direction, int index, AllQuizzes allQuizzes) async {
    Question questionToDelete = this.widget.quizz.questions[index];

    for(int i = 0; i< this.widget.quizz.questions.length; i++) {
      if(widget.quizz.questions[i].id == questionToDelete.id) {
        widget.quizz.questions.removeAt(i);
      }
    }

    allQuizzes.deleteQuestion(questionToDelete);
  }

  void onAddFABClicked() {
    Navigator.of(context).pushNamed("/management/questions/add", arguments: this.widget.quizz);
  }
}