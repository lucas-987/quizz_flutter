import 'package:flutter/material.dart';
import 'package:quizz/views/home_view.dart';
import 'package:quizz/widgets/home_widget.dart';

class HomeController extends State<HomeWidget> {

  @override
  Widget build(BuildContext context) => HomeView(this);

  Function selectQuizzButtonPressed = (BuildContext context) {
    Navigator.of(context).pushNamed("/game");
  };

  void manageQuizzesButtonPressed() {
    Navigator.of(context).pushNamed("/management");
  }
}