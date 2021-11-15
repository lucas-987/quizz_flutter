import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quizz/controllers/home_controller.dart';
import 'package:quizz/views/widget_view.dart';
import 'package:quizz/widgets/home_widget.dart';

class HomeView extends WidgetView<HomeWidget, HomeController> {

  HomeView(HomeController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    ElevatedButton selectQuizzButton = ElevatedButton(
      child: const Text("Select a quizz", textDirection: TextDirection.ltr,),
      style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 20)),
      onPressed: () => state.selectQuizzButtonPressed(context),
    );

    ElevatedButton manageQuizzButton = ElevatedButton(
      child: const Text("Manage quizzes", textDirection: TextDirection.ltr,),
      style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 20)),
      onPressed: state.manageQuizzesButtonPressed,
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Quizz"),
      ),
      body: Container(
        color: Colors.brown,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Center(
                  child: selectQuizzButton,
              ),
              SizedBox(height: 50),
              Center(
                  child: manageQuizzButton
              )
            ],
          )
        )
      )
    );
  }

}