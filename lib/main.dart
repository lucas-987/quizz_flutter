import 'package:flutter/material.dart';
import 'package:quizz/application_state/all_quizzes.dart';
import 'package:quizz/routes/route_generator.dart';
import 'package:quizz/widgets/game/select/game_select_quizz_widget.dart';
import 'package:quizz/widgets/home_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (context) => AllQuizzes(),
        child: const MaterialApp(
          initialRoute: "/",
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
      )
  );
}


