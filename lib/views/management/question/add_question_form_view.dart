import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quizz/application_state/all_quizzes.dart';
import 'package:quizz/controllers/management/question/add_question_form_controller.dart';
import 'package:quizz/tools/text_tools.dart';
import 'package:quizz/views/widget_view.dart';
import 'package:quizz/widgets/management/question/add_question_form_choices_widget.dart';
import 'package:quizz/widgets/management/question/add_question_form_widget.dart';

class AddQuestionFormView extends WidgetView<AddQuestionFormWidget, AddQuestionFormController> {

  AddQuestionFormView(AddQuestionFormController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create a question"),
        centerTitle: true,
      ),

      body: Form(
        key: this.state.formKey,
        child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Question",
                      hintText: "The sentence that formulates the question"
                  ),
                  validator: (String? value) => this.state.validateQuestionSentence(value),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                  ],
                  controller: TextTools.newTextEditingController("${this.state.correctChoiceIndex}"),
                  decoration: const InputDecoration(
                    labelText: "Correct answer",
                    hintText: "The number of the correct answer",
                  ),
                  validator: (String? input) => this.state.validateCorrectChoiceIndex(input),
                ),
              ),
              SizedBox(height: 20),
              Text("Answers"),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: AddQuestionFormChoicesWidget(
                    this.state.choicesValue,
                    this.state.correctChoiceIndex,
                    this.state.addChoice,
                    this.state.onChoiceValueChanged,
                    this.state.deleteChoice,
                    this.state.onChoiceOrderChanged
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                child: Text("Create"),
                onPressed: () => this.state.validateForm(),
              )
            ]
        ),
      ),
    );
  }
}