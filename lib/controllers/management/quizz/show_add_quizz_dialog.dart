import 'package:flutter/material.dart';
import 'package:quizz/tools/Tuple.dart';

Widget showAddQuizzDialog(BuildContext context) {
  String? selectedOption = null;
  String? textInputValue = null;

  return StatefulBuilder(
    builder: (context, setState) {
      return AlertDialog(
        title: const Text("Add quizz"),
        content: SingleChildScrollView(
            child: ListBody(
              children: [
                DropdownButton(
                  hint: const Text("Load or create a quizz ?"),
                  value: selectedOption,
                  items: const [
                    DropdownMenuItem<String>(
                      child: Text("Load a quizz from url"),
                      value: "load",
                    ),
                    DropdownMenuItem(
                        child: Text("Create a new quizz"),
                        value: "create"
                    )
                  ],
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedOption = newValue;
                    });
                  },
                ),
                const SizedBox(height: 20),
                Visibility(
                  visible: selectedOption != null && (selectedOption == "create" || selectedOption == "load"),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: selectedOption != null ? (selectedOption == "create" ? "Name" : selectedOption == "load" ? "Url" : "") : ""
                    ),
                    onChanged: (String value) {
                      setState(() {
                        textInputValue = value;
                      });
                    },
                  ),
                )
              ],
            )
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          TextButton(
            child: const Text("Add"),
            onPressed: () => Navigator.pop(context, Tuple<String?, String?>(selectedOption, textInputValue)),
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