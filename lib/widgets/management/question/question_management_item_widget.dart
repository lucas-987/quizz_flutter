import 'package:flutter/material.dart';
import 'package:quizz/controllers/management/question/question_management_item_controller.dart';
import 'package:quizz/model/question.dart';

class QuestionManagementItemWidget extends StatefulWidget {

  Question question;

  QuestionManagementItemWidget(this.question, {Key? key}) : super(key: key);

  @override
  QuestionManagementItemController createState() => QuestionManagementItemController();
}