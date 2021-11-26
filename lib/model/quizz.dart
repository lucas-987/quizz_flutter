import 'package:flutter/widgets.dart';
import 'package:quizz/model/question.dart';

final String tableQuizz = "quizzs";

class QuizzFields {
  static final List<String> values = [
    /// Add all fields
    id, url, title
  ];

  static const String id = '_id';
  static const String url = 'url';
  static const String title = 'title';
}

class Quizz {
  int? id;
  String? url;
  String? title;
  List<Question> questions = new List.empty();

  Quizz(this.title);
  Quizz.WithUrl(this.title, this.url);
  Quizz.WithUrlAndId(this.id, this.title, this.url);
  Quizz.WithQuestions(this.title, this.questions);
  Quizz.WithUrlAndQuestions(this.title, this.url, this.questions);

  static Quizz fromDbJson(Map<String, Object?> json) {
    return Quizz.WithUrlAndId(
      json[QuizzFields.id] as int?,
      json[QuizzFields.title] as String?,
      json[QuizzFields.url] as String?
    );
  }

  Map<String, Object?> toDbJson() {
    return {
      QuizzFields.id : id,
      QuizzFields.title : title,
      QuizzFields.url : url
    };
  }
}