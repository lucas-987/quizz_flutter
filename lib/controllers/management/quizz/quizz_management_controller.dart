import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quizz/application_state/all_quizzes.dart';
import 'package:quizz/controllers/management/quizz/show_add_quizz_dialog.dart';
import 'package:quizz/model/choice.dart';
import 'package:quizz/model/question.dart';
import 'package:quizz/model/quizz.dart';
import 'package:quizz/tools/Tuple.dart';
import 'package:quizz/views/management/quizz/quizz_management_view.dart';
import 'package:quizz/widgets/management/quizz/quizz_management_widget.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

class QuizzManagementController extends State<QuizzManagementWidget> {
  
  @override
  Widget build(BuildContext context) => QuizzManagementView(this);

  void onQuizzDismissed(direction, int index, AllQuizzes allQuizzes) {
    Quizz quizzToDelete = allQuizzes.quizzes[index];

    allQuizzes.deleteQuizz(quizzToDelete);
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

    dialogResult.then((result) async {
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

        createdQuizz = await allQuizzes.createQuizz(result.item2!);
      }
      else if(result.item1 == "load") {
        downloadQuizz(allQuizzes, result.item2!);
      }

      if(createdQuizz != null) Navigator.of(context).pushNamed("/management/questions", arguments: createdQuizz);
    });
  }

  void downloadQuizz(AllQuizzes allQuizzes, String url) async {
    http.Response response;
    try{
      response = await http.get(Uri.parse(url));
    } on HttpException catch(e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to load quizz from url"))
      );
      return;
    }


    if(response.statusCode == 200) {
      var content = Utf8Decoder().convert(response.bodyBytes);

      final document = XmlDocument.parse(content);

      Iterable<XmlElement> quizzsXml = document.findAllElements("Quizz");

      if(quizzsXml.length == 0){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to load quizz from url : unvalid content"))
          );
          return;
      }

      List<Quizz> quizzs = [];

      for(XmlElement quizzXml in quizzsXml) {
        Quizz quizz;
        try{
          quizz = Quizz.fromXml(quizzXml, url);
        } on FormatException catch(e) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Failed to load quizz from url : unvalid content"))
          );
          return;
        }

        quizzs.add(quizz);
      }

      allQuizzes.loadQuizzes(quizzs, url);
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to load quizz from url"))
      );
    }
  }
}