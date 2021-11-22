import 'package:flutter/material.dart';
import 'package:quizz/application_state/all_quizzes.dart';
import 'package:quizz/controllers/management/quizz/show_add_quizz_dialog.dart';
import 'package:quizz/model/quizz.dart';
import 'package:quizz/tools/Tuple.dart';
import 'package:quizz/views/management/quizz/quizz_management_view.dart';
import 'package:quizz/widgets/management/quizz/quizz_management_widget.dart';

class QuizzManagementController extends State<QuizzManagementWidget> {
  
  @override
  Widget build(BuildContext context) => QuizzManagementView(this);

  void onQuizzDismissed(direction, int index, AllQuizzes allQuizzes) {
    allQuizzes.quizzes.removeAt(index);
  }

  void onReorder(int oldIndex, int newIndex, AllQuizzes allQuizzes) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final Quizz quizz = allQuizzes.quizzes.removeAt(oldIndex);
    allQuizzes.quizzes.insert(newIndex, quizz);
  }

  void onAddFABClicked(AllQuizzes allQuizzes) {
    Future<Tuple<String?, String?>?> dialogResult = showDialog<Tuple<String?, String?>>(
      context: context,
      builder: (context) => showAddQuizzDialog(context)
    );

    dialogResult.then((result) {
      if(result == null || result is! Tuple<String?, String?>) {
        return;
      }

      if(result.item1 == null || result.item2 == null) {
        return;
      }

      Quizz? createdQuizz;

      if(result.item1 == "create") {
        if(RegExp(r'^\s*$').hasMatch(result.item2!)) {
          return;
        }

        createdQuizz = allQuizzes.createQuizz(result.item2!);
      }
      else if(result.item1 == "load") {
        // createQuizz =
      }

      if(createdQuizz != null) Navigator.of(context).pushNamed("/management/questions", arguments: createdQuizz);
    });
  }
}