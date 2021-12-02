import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizz/views/game/play/game_choice_view.dart';
import 'package:quizz/widgets/game/play/game_choice_widget.dart';

class GameChoiceController extends State<GameChoiceWidget> {

  int wrongChoiceIndex = -1;
  int rightChoiceIndex = -1;
  bool clickDisabled = false;

  @override
  Widget build(BuildContext context) => GameChoiceView(this);

  void onChoiceSubmitt(int index) {
    bool? goodChoice = this.widget.onClicked(widget.question.choices[index].value);

    if(goodChoice == null) {}
    else if(goodChoice){
      setState(() {
        rightChoiceIndex = index;
        clickDisabled = true;
      });
    }
    else {
      setState(() {
        wrongChoiceIndex = index;
        clickDisabled = true;
      });
    }

    var test = Timer(const Duration(seconds: 1), () => timerCallBack());
  }

  void timerCallBack() {
    widget.nextQuestion();

    setState(() {
      clickDisabled = false;
      wrongChoiceIndex = -1;
      rightChoiceIndex = -1;
    });
  }
}