import 'package:flutter/material.dart';
import 'package:quizz/application_state/all_quizzes.dart';
import 'package:quizz/routes/route_generator.dart';
import 'package:provider/provider.dart';

void main() async {

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


