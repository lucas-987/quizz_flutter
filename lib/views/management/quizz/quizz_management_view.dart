import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz/application_state/all_quizzes.dart';
import 'package:quizz/controllers/management/quizz/quizz_management_controller.dart';
import 'package:quizz/views/widget_view.dart';
import 'package:quizz/widgets/management/quizz/quizz_management_item_widget.dart';
import 'package:quizz/widgets/management/quizz/quizz_management_widget.dart';

class QuizzManagementView extends WidgetView<QuizzManagementWidget, QuizzManagementController> {

  QuizzManagementView(QuizzManagementController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AllQuizzes>(
      builder: (context, allQuizzes, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Quizz management")
        ),
        body: Center(
          child: ReorderableListView.builder(
            itemBuilder: (context, int index) {
              return Dismissible(
                key: Key("${allQuizzes.quizzes[index].id}"),
                onDismissed: (direction) => this.state.onQuizzDismissed(direction, index, allQuizzes),
                background: Container(color: Colors.red,),
                child: QuizzManagementItemWidget(allQuizzes.quizzes[index]),
              );
            },
            itemCount: allQuizzes.quizzes.length,
            onReorder: (oldIndex, newIndex) => this.state.onReorder(oldIndex, newIndex, allQuizzes)
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () => this.state.onAddFABClicked(allQuizzes),
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
          backgroundColor: Colors.lightGreen,
        ),
      ),
    );
  }
}