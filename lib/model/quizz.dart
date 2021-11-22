import 'package:flutter/widgets.dart';
import 'package:quizz/model/question.dart';

class Quizz {
  String id = UniqueKey().toString();
  String? title;
  String? url;
  List<Question> questions = new List.empty();

  Quizz(this.title);
  Quizz.WithUrl(this.title, this.url);
  Quizz.WithQuestions(this.title, this.questions);
  Quizz.WithUrlAndQuestions(this.title, this.url, this.questions);
}