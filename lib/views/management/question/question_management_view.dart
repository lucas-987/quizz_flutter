import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quizz/controllers/management/question/question_management_controller.dart';
import 'package:quizz/model/quizz.dart';
import 'package:quizz/views/widget_view.dart';
import 'package:quizz/widgets/management/question/question_management_item_widget.dart';
import 'package:quizz/widgets/management/question/question_management_widget.dart';

class QuestionManagementView extends WidgetView<QuestionManagementWidget, QuestionManagementController> {

  QuestionManagementView(QuestionManagementController state, {Key? key}) : super(state, key: key);

  Widget questionsList() {
    return ReorderableListView.builder(
      itemBuilder: (context, int index) {
        return Dismissible(
          key: Key('$index'),
          child: QuestionManagementItemWidget(this.widget.quizz.questions[index]),
          background: Container(color: Colors.red),
          onDismissed: (direction) => this.state.onDismissed(direction, index),
        );
      },
      itemCount: this.widget.quizz.questions.length,
      onReorder: (oldIndex, newIndex) => this.state.onReorder(oldIndex, newIndex),
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(this.widget.quizz.title ?? "no title"),
      ),
      body: this.widget.quizz.questions.length > 0 ? questionsList() : noQuestionsMessage,

      floatingActionButton: FloatingActionButton(
        onPressed: () => this.state.onAddFABClicked(),
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Colors.lightGreen,
      )
    );
  }
}