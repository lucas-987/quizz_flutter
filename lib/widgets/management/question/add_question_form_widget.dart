import 'package:flutter/material.dart';
import 'package:quizz/controllers/management/question/add_question_form_controller.dart';
import 'package:quizz/model/quizz.dart';

class AddQuestionFormWidget extends StatefulWidget {

  Quizz quizz;

  AddQuestionFormWidget(this.quizz, {Key? key}) : super(key: key);

  @override
  AddQuestionFormController createState() => AddQuestionFormController();
}