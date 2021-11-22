import 'package:flutter/material.dart';
import 'package:quizz/model/quizz.dart';
import 'package:quizz/views/management/quizz/quizz_management_item_view.dart';
import 'package:quizz/widgets/management/quizz/quizz_management_item_widget.dart';

class QuizzManagementItemController extends State<QuizzManagementItemWidget> {

  @override
  Widget build(BuildContext context) => QuizzManagementItemView(this);

  void onTap(Quizz quizz) {
    Navigator.of(context).pushNamed('/management/questions', arguments: quizz);
  }
}