import 'package:flutter/material.dart';
import 'package:quizz/tools/text_tools.dart';

Widget showChangeTextDialog(BuildContext context, String title, String labelText, String? value) {

  String? textInputValue = value;

  return StatefulBuilder(
    builder: (context, setState) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: labelText
                ),
                controller: TextTools.newTextEditingController(textInputValue),
                onChanged: (String value) {
                  setState(() {
                    textInputValue = value;
                  });
                },
              ),
            ],
          ),
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          TextButton(
            child: const Text("Validate"),
            onPressed: () => Navigator.pop(context, textInputValue),
          ),
          TextButton(
            child: const Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          )
        ],
      );
    },
  );
}