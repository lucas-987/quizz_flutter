import 'package:flutter/material.dart';
import 'package:quizz/application_state/all_quizzes.dart';
import 'package:quizz/model/choice.dart';
import 'package:quizz/views/management/choice/choice_management_view.dart';
import 'package:quizz/widgets/management/choice/choice_management_widget.dart';

import '../show_change_text_dialog.dart';

class ChoiceManagementController extends State<ChoiceManagementWidget> {

  @override
  Widget build(BuildContext context) => ChoiceManagementView(this);

  String? newQuestionName;
  late String answer;

  @override
  void initState() {
    answer = widget.question.answer;
  }

  void showChangeQuestionTitleDialog(AllQuizzes allQuizzes) {
    Future<String?> dialogResult = showDialog<String?>(
        context: context,
        builder: (context) => showChangeTextDialog(context, "Change question sentence", "Sentence", newQuestionName ?? widget.question.sentence)
    );

    dialogResult.then((result) {
      if(result != null && result.isNotEmpty){
        setState(() {
          newQuestionName = result;
        });
        widget.question.sentence = result;
        allQuizzes.updateQuestion(widget.question);
      }
    });
  }

  void onReorder(int oldIndex, int newIndex, AllQuizzes allQuizzes) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final Choice choice = this.widget.question.choices.removeAt(oldIndex);
    this.widget.question.choices.insert(newIndex, choice);

    for(int i = 0; i<widget.question.choices.length; i++) {
      Choice choice = widget.question.choices[i];

      choice.order = i;
      allQuizzes.updateChoice(choice);
    }
  }

  void onDismissed(direction, int index, AllQuizzes allQuizzes) async {
    Choice choiceToDelete = this.widget.question.choices[index];

    for(int i = 0; i< this.widget.question.choices.length; i++) {
      if(widget.question.choices[i].id == choiceToDelete.id) {
        widget.question.choices.removeAt(i);
      }
    }

    allQuizzes.deleteChoice(choiceToDelete);
  }

  Future<bool?> confirmDismiss() async {
    if(widget.question.choices.length > 2) return true;
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("A question must have at least 2 choices.")));
      return false;
    }
  }

  void onAddFABClicked(AllQuizzes allQuizzes) {
    Future<String?> dialogResult = showDialog<String?>(
        context: context,
        builder: (context) => showChangeTextDialog(context, "Add a new choice", "Value", "")
    );

    dialogResult.then((value) async {
      if(value != null && value.isNotEmpty){
        Choice newChoice = await allQuizzes.createChoice(value, widget.question);
      }
    });
  }

  void onChoiceClicked(Choice choice, AllQuizzes allQuizzes) {
    Future<String?> dialogResult = showDialog<String?>(
        context: context,
        builder: (context) => showChangeTextDialog(context, "Change choice value", "Value", choice.value)
    );

    dialogResult.then((value) {
      if(value != null && value.isNotEmpty){
        choice.value = value;
        allQuizzes.updateChoice(choice);
      }
    });
  }

  void onChoiceSelected(Choice choice, AllQuizzes allQuizzes) {
    this.widget.question.answer = choice.value;
    setState(() {
      answer = choice.value;
    });

    allQuizzes.updateQuestion(this.widget.question);
  }
}