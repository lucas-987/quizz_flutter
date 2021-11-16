import 'package:flutter/material.dart';

Widget showAnswerDialog(BuildContext context, String answer) {
  bool answerShowed = false;

  return WillPopScope(
    child: StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
              title: Text("Show answer"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text("Do you want to see the answer ?"),
                    SizedBox(height: 20),
                    Center(
                        child: Visibility(
                            visible: answerShowed,
                            child: Text(answer)
                        )
                    )
                  ],
                ),
              ),
              actionsAlignment: MainAxisAlignment.spaceEvenly,
              actions: [
                TextButton(
                  child: const Text("Show"),
                  onPressed: () {
                    setState(() {
                      answerShowed = true;
                    });
                  },
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, answerShowed),
                  child: const Text("Exit")
                )
              ]
          );
        }
    ),


    onWillPop: () {
      Navigator.pop(context, answerShowed);
      return Future.value(true);
    }
  );
}

