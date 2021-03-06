import 'package:flutter/material.dart';
import 'package:quizz/model/quizz.dart';
import 'package:quizz/widgets/game/play/game_widget.dart';
import 'package:quizz/widgets/game/select/game_select_quizz_widget.dart';
import 'package:quizz/widgets/home_widget.dart';

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