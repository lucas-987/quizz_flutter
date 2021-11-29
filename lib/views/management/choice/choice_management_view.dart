import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz/application_state/all_quizzes.dart';
import 'package:quizz/controllers/management/choice/choice_management_controller.dart';
import 'package:quizz/views/widget_view.dart';
import 'package:quizz/widgets/management/choice/choice_management_item_widget.dart';
import 'package:quizz/widgets/management/choice/choice_management_widget.dart';

class ChoiceManagementView extends WidgetView<ChoiceManagementWidget, ChoiceManagementController> {

  ChoiceManagementView(ChoiceManagementController state, {Key? key}) : super(state, key: key);

  Widget choicesList(AllQuizzes allQuizzes) {
    return ReorderableListView.builder(
      itemBuilder: (context, int index) {
        return Dismissible(
          key: Key("${this.widget.question.choices[index].id}"),
          child: ChoiceManagementItemWidget(
              this.widget.question.choices[index],
              this.state.answer == this.widget.question.choices[index].value,
              (choice) => this.state.onChoiceClicked(choice, allQuizzes),
              (choice) => this.state.onChoiceSelected(choice, allQuizzes)
          ),
          background: Container(color: Colors.red),
          confirmDismiss: (direction) => this.state.confirmDismiss(),
          onDismissed: (direction) => this.state.onDismissed(direction, index, allQuizzes),
        );
      },
      itemCount: this.widget.question.choices.length,
      onReorder: (oldIndex, newIndex) => this.state.onReorder(oldIndex, newIndex, allQuizzes),
    );
  }

  Widget noChoicesMessage = Card(
      color: Colors.red[600],
      child: Wrap(
          children: [
            Container(
                margin: const EdgeInsets.all(5),
                child: const ListTile(
                  title: Center(
                      child: Text("There are no choices in this question yet. You can add a question by clicking the + button.")
                  ),
                  tileColor: Colors.white,
                )
            )
          ]
      )
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<AllQuizzes>(
      builder: (context, allQuizzes, child) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: GestureDetector(
              onTap: () => this.state.showChangeQuestionTitleDialog(allQuizzes),
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text("${this.state.newQuestionName ?? this.widget.question.sentence}"),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.edit,
                ),
                tooltip: "Edit quizz title",
                onPressed: () => this.state.showChangeQuestionTitleDialog(allQuizzes),
              )
            ],
          ),
          body: this.widget.question.choices.length > 0 ? choicesList(allQuizzes) : noChoicesMessage,

          floatingActionButton: FloatingActionButton(
            onPressed: () => this.state.onAddFABClicked(allQuizzes),
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
            backgroundColor: Colors.lightGreen,
          )
      ),
    );
  }
}