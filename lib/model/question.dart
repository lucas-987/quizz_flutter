class Question {
  String sentence;
  String answer;
  int order = 1;
  List<String> choices = [];

  Question(this.sentence, this.choices, this.answer);
  Question.WithOrder(this.sentence, this.choices, this.answer, this.order);
}