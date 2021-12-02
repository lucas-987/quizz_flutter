import 'package:flutter/material.dart';
import 'package:quizz/controllers/management/question/add_question_form_choices_controller.dart';

class AddQuestionFormChoicesWidget extends StatefulWidget {

  List<String?> choices;
  int selectedIndex;

  final void Function() onChoiceAdded;
  final void Function(int index, String? value) onChoiceValueChanged;
  final void Function(int index) onChoiceDismissed;
  final void Function(int oldIndex, int newIndex) onChoiceOrderChanged;
  final void Function(int newIndex) onSelectedAnswerChanged;

  AddQuestionFormChoicesWidget(this.choices, this.selectedIndex,
      this.onChoiceAdded, this.onChoiceValueChanged, this.onChoiceDismissed, this.onChoiceOrderChanged, this.onSelectedAnswerChanged, {Key? key}) : super(key: key);

  @override
  AddQuestionFormChoicesController createState() => AddQuestionFormChoicesController();
}