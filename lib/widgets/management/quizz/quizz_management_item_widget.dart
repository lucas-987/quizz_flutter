import 'package:flutter/material.dart';
import 'package:quizz/controllers/management/quizz/quizz_management_item_controller.dart';
import 'package:quizz/model/quizz.dart';

class QuizzManagementItemWidget extends StatefulWidget {

  Quizz quizz;

  QuizzManagementItemWidget(this.quizz, {Key? key}) : super(key: key);

  @override
  QuizzManagementItemController createState() => QuizzManagementItemController();
}