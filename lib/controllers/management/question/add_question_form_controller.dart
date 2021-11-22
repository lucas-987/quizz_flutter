import 'package:flutter/material.dart';
import 'package:quizz/application_state/all_quizzes.dart';
import 'package:quizz/model/question.dart';
import 'package:quizz/views/management/question/add_question_form_view.dart';
import 'package:quizz/widgets/management/question/add_question_form_widget.dart';

class AddQuestionFormController extends State<AddQuestionFormWidget> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => AddQuestionFormView(this);

  List<String?> choicesValue = [null, null];
  int correctChoiceIndex = 1;
  String? questionSentence = null;

  void validateForm() {
    //if form is valid
    if(formKey.currentState!.validate()) {
      Question newQuestion = Question.WithOrder(
          questionSentence!,
          choicesValue.where((choice) => choice != null).cast<String>().toList(),
          choicesValue[correctChoiceIndex]!,
          widget.quizz.questions.length
      );

      widget.quizz.questions.add(newQuestion);
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed("/management/questions", arguments: widget.quizz);
    }
  }

  String? validateQuestionSentence(String? sentence) {
    if(sentence == null || sentence.isEmpty) {
      return "Field required";
    }

    setState(() {
      this.questionSentence = sentence;
    });
    return null;
  }

  String? validateCorrectChoiceIndex(String? input) {
    if(input == null || input.isEmpty) return "Field required";

    try {
      int inputInt = int.parse(input);
      if(inputInt >= choicesValue.length || inputInt < 0) return "Unvalid value";
    } on FormatException catch(exception) {
      return "Incorrect format";
    }

    return null;
  }

  void addChoice() {
    setState(() {
      choicesValue.add(null);
    });
  }

  void onChoiceValueChanged(int index, String? value) {
    if(index < choicesValue.length && index >= 0) {
      setState(() {
        choicesValue[index] = value;
      });
    }
  }

  void deleteChoice(int index) {
    if(choicesValue.length > 2 && index < choicesValue.length && index >= 0) {
      setState(() {
        if(index < correctChoiceIndex-1 || (index == correctChoiceIndex-1 && correctChoiceIndex-1 == choicesValue.length-1)) {
          correctChoiceIndex--;
        }

        choicesValue.removeAt(index);
      });
    }
  }

  void onChoiceOrderChanged(int oldIndex, int newIndex) {
    if(oldIndex < choicesValue.length && oldIndex >= 0 && newIndex < choicesValue.length+1 && newIndex >= 0) {
      setState(() {
        //after end of list
        /*if(newIndex == choicesValue.length) {
          newIndex--;
        }*/

        if (oldIndex < newIndex) {
          newIndex -= 1;
        }

        final String? value = choicesValue[oldIndex];
        choicesValue.removeAt(oldIndex);
        choicesValue.insert(newIndex, value);

        if(correctChoiceIndex - 1 == oldIndex) correctChoiceIndex = newIndex + 1;
      });
    }
  }
}