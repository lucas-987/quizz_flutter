import 'package:flutter/material.dart';
import 'package:quizz/controllers/management/choice/choice_management_controller.dart';
import 'package:quizz/model/question.dart';

class ChoiceManagementWidget extends StatefulWidget {

  Question question;

  ChoiceManagementWidget(this.question, {Key? key}) : super(key: key);

  @override
  ChoiceManagementController createState() => ChoiceManagementController();
}