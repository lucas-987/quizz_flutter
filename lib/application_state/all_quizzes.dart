import 'package:flutter/material.dart';
import 'package:quizz/model/quizz.dart';
import 'package:quizz/model/question.dart';

class AllQuizzes with ChangeNotifier {
  List<Quizz> quizzes = <Quizz>[
    Quizz.WithQuestions("test1", <Question>[
      Question("this one is true", ["true", "false"], "true"),
      Question("this one is false", ["true", "false"], "false"),
      Question("that one is false", ["true", "false"], "false"),
      Question("that one is true", ["true", "false"], "true")
    ]),

    Quizz.WithQuestions("test2", <Question>[
      Question("question 1", ["true", "false"], "true"),
      Question("question 2", ["true", "false"], "false"),
      Question("question 3", ["true", "false"], "true")
    ])
  ];


}