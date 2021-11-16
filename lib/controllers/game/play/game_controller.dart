import 'package:flutter/material.dart';
import 'package:quizz/controllers/game/play/show_answer_dialog.dart';
import 'package:quizz/views/game/play/game_view.dart';
import 'package:quizz/widgets/game/play/game_widget.dart';

class GameController extends State<GameWidget> {

  int currentQuestionIndex = 0;
  int score = 0;
  bool answerViewed = false;

  @override
  Widget build(BuildContext context) => GameView(this);

  void nextButtonClicked() {
    if(currentQuestionIndex < widget.quizz.questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        answerViewed = false;
      });
    }
    else {
      Navigator.of(context).pushNamed("/game/score", arguments: score);
    }
  }

  void showAnwserButtonClicked() {
    Future<bool?> dialogResult = showDialog<bool>(
        context: context,
        builder: (context) => showAnswerDialog(context, this.widget.quizz.questions[currentQuestionIndex].answer)
    );

    dialogResult.then((result) {
      bool resultValue = false;

      if(result != null) {
        resultValue = result;
      }

      setState(() {
        answerViewed = resultValue;
      });
    });
  }

  void checkAnwser(String anwser) { // TODO eventuellement, representer une reponse par un objet
    if(answerViewed) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You have seen the answer !"), duration: const Duration(milliseconds: 1000)));
      return;
    }

    if(anwser == widget.quizz.questions[currentQuestionIndex].answer) {
      setState(() {
        score++;
      });
    }

    nextButtonClicked();
  }
}