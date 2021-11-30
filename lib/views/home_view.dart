import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quizz/controllers/home_controller.dart';
import 'package:quizz/views/widget_view.dart';
import 'package:quizz/widgets/home_widget.dart';

class HomeView extends WidgetView<HomeWidget, HomeController> {

  HomeView(HomeController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    TextButton selectQuizzButton = TextButton(
      child: const Text("Select a quizz", textDirection: TextDirection.ltr,),
      style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      onPressed: () => state.selectQuizzButtonPressed(context),
    );

    TextButton manageQuizzButton = TextButton(
      child: const Text("Manage quizzes", textDirection: TextDirection.ltr,),
      style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      onPressed: state.manageQuizzesButtonPressed,
    );

    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.8, 0.0),
                colors: [
                  Color.fromRGBO(158, 64, 166, 1),
                  Color.fromRGBO(252, 64, 80, 1),
                ],
                tileMode: TileMode.repeated
            )
          ),
        ),

        Positioned(
          top: 0.25 * MediaQuery.of(context).size.height,
          right: 0.125 * MediaQuery.of(context).size.width,
          child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(64, 64, 64, 0.6),
                        spreadRadius: 10,
                        blurRadius: 7,
                        offset: Offset(-3, 5)
                    )
                  ]
              ),
              width: 0.75 * MediaQuery.of(context).size.width,
              height: 0.5 * MediaQuery.of(context).size.height,
              child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Center(
                        child: selectQuizzButton,
                      ),
                      SizedBox(height: 18),
                      Center(
                          child: manageQuizzButton
                      )
                    ],
                  )
              )
          ),
        ),
      ],
    );
  }

}