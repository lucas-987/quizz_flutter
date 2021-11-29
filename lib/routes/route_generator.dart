import 'package:flutter/material.dart';
import 'package:quizz/model/question.dart';
import 'package:quizz/model/quizz.dart';
import 'package:quizz/widgets/game/play/game_score_widget.dart';
import 'package:quizz/widgets/game/play/game_widget.dart';
import 'package:quizz/widgets/game/select/game_select_quizz_widget.dart';
import 'package:quizz/widgets/home_widget.dart';
import 'package:quizz/widgets/management/choice/choice_management_widget.dart';
import 'package:quizz/widgets/management/question/add_question_form_widget.dart';
import 'package:quizz/widgets/management/question/question_management_widget.dart';
import 'package:quizz/widgets/management/quizz/quizz_management_widget.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeWidget());
      case '/game':
      case '/game/select':
        return MaterialPageRoute(builder: (_) => GameSelectQuizzWidget());

      case '/game/play':
        if(args != null && args.runtimeType == Quizz ) {
          return MaterialPageRoute(builder: (_) => GameWidget(args as Quizz));
        }

        return _errorRoute();

      case '/game/score':
        if(args != null && args.runtimeType == int) {
          return MaterialPageRoute(builder: (_) => GameScoreWidget(args as int));
        }

        return _errorRoute();

      case '/management':
        return MaterialPageRoute(builder: (_) => QuizzManagementWidget());

      case '/management/questions':
        if(args != null && args.runtimeType == Quizz) {
          return MaterialPageRoute(builder: (_) => QuestionManagementWidget(args as Quizz));
        }

        return _errorRoute();

      case '/management/questions/add':
        if(args != null && args.runtimeType == Quizz){
          return MaterialPageRoute(builder: (_) => AddQuestionFormWidget(args as Quizz));
        }

        return _errorRoute();

      case '/management/choices':
        if(args != null && args.runtimeType == Question){
          return MaterialPageRoute(builder: (_) => ChoiceManagementWidget(args as Question));
        }

        return _errorRoute();

      default:
      // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}