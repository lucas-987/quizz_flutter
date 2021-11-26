import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:quizz/application_state/all_quizzes.dart';
import 'package:quizz/controllers/management/question/question_management_controller.dart';
import 'package:quizz/views/widget_view.dart';
import 'package:quizz/widgets/management/question/question_management_item_widget.dart';
import 'package:quizz/widgets/management/question/question_management_widget.dart';

class QuestionManagementView extends WidgetView<QuestionManagementWidget, QuestionManagementController> {

  QuestionManagementView(QuestionManagementController state, {Key? key}) : super(state, key: key);

  Widget questionsList(AllQuizzes allQuizzes) {
    return ReorderableListView.builder(
      itemBuilder: (context, int index) {
        return Dismissible(
          key: Key("${this.widget.quizz.questions[index].id}"),
          child: QuestionManagementItemWidget(this.widget.quizz.questions[index]),
          background: Container(color: Colors.red),
          onDismissed: (direction) => this.state.onDismissed(direction, index, allQuizzes),
        );
      },
      itemCount: this.widget.quizz.questions.length,
      onReorder: (oldIndex, newIndex) => this.state.onReorder(oldIndex, newIndex, allQuizzes),
    );
  }

  Widget noQuestionsMessage = Card(
      color: Colors.red[600],
      child: Wrap(
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            child: const ListTile(
              title: Center(
                child: Text("There are no questions in this quizz yet. You can add a question by clicking the + button.")
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
              onTap: () => this.state.showChangeQuizzTitleDialog(allQuizzes),
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text("${this.state.newQuizzName ?? this.widget.quizz.title ?? "no title"}"),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.edit,
                ),
                tooltip: "Edit quizz title",
                onPressed: () => this.state.showChangeQuizzTitleDialog(allQuizzes),
              )
            ],
          ),
          body: this.widget.quizz.questions.length > 0 ? questionsList(allQuizzes) : noQuestionsMessage,

          floatingActionButton: FloatingActionButton(
            onPressed: () => this.state.onAddFABClicked(),
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