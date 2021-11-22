import 'package:flutter/material.dart';
import 'package:quizz/controllers/management/question/question_management_controller.dart';
import 'package:quizz/model/quizz.dart';

class QuestionManagementWidget extends StatefulWidget {

  Quizz quizz;

  QuestionManagementWidget(this.quizz, {Key? key}) : super(key: key);

  @override
  QuestionManagementController createState() => QuestionManagementController();
}