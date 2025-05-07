import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/models/state.dart';
import 'package:quiz_app/screens/home_screen/app_home_screen.dart';
import 'package:quiz_app/screens/questions_screen/app_questions_screen.dart';
import 'package:quiz_app/screens/results_screen/app_results_screen.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      home: Consumer<StateModel>(
        builder: (context, state, child) {
          return Scaffold(
            body: Container(
              color: const Color(0xffBAD9D6), 
              child: switch(state.quizStatus) {
                "in-progress" => const QuestionsScreen(),
                "complete" => const ResultsScreen(),
                _ => const HomeScreen(),
              }
            )
          );
        }
      )
    );
  }
}
