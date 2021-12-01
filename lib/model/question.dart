import 'package:xml/xml.dart';

import 'choice.dart';

final String tableQuestion = "questions";

class QuestionFields {
  static final List<String> values = [
    /// Add all fields
    id, sentence, answer, order
  ];

  static const String id = '_id';
  static const String sentence = 'sentence';
  static const String answer = 'answer';
  static const String order = 'position';
  static const String quizzId = 'quizzId';
}

class Question {
  int? id;
  int? quizzId;
  String sentence;
  String answer;
  int order = 1;
  List<Choice> choices = [];

  Question(this.sentence, this.choices, this.answer);
  Question.WithOrder(this.sentence, this.choices, this.answer, this.order);
  Question.WithIdAndOrder(this.id, this.quizzId, this.sentence, this.answer, this.order);

  static Question fromDbJson(Map<String, Object?> json) {
    return Question.WithIdAndOrder(
      json[QuestionFields.id] as int?,
      json[QuestionFields.quizzId] as int?,
      json[QuestionFields.sentence] as String,
      json[QuestionFields.answer] as String,
      json[QuestionFields.order] as int
    );
  }

  Map<String, Object?> toDbJson() {
    return {
      QuestionFields.id : id,
      QuestionFields.quizzId : quizzId,
      QuestionFields.sentence : sentence,
      QuestionFields.answer : answer,
      QuestionFields.order : order
    };
  }

  static Question fromXml(XmlElement questionXml) {

    XmlElement? propositionsXml = questionXml.getElement("Propositions");
    if(propositionsXml == null) {
      throw FormatException();
    }
    Iterable<XmlElement> choicesXml = propositionsXml.findElements("Proposition");
    List<Choice> choices = [];

    for(XmlElement choiceXml in choicesXml) {
      Choice choice = Choice.fromXml(choiceXml);
      choices.add(choice);
    }

    XmlElement? responseXml = questionXml.getElement("Reponse");
    String? responseNumberString = responseXml?.getAttribute("valeur");
    if(responseNumberString == null) {
      throw FormatException();
    }
    int responseNumber;
    try{
      responseNumber = int.parse(responseNumberString);
    } on FormatException catch(e) {
      throw FormatException();
    }

    if(responseNumber > choices.length){
      throw FormatException();
    }

    String answer = choices[responseNumber - 1].value;

    String sentence = questionXml.innerText;
    sentence = sentence.replaceAll(RegExp(r'(\n)+'), "§§separator§§");
    sentence = sentence.replaceAll(RegExp(r'(\t)+'), "");
    List<String> sentenceSplitted = sentence.split("§§separator§§");
    sentence = sentenceSplitted[1];

    return  Question(sentence, choices, answer);
  }
}