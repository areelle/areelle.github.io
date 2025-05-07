import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/models/state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(context) {
    return Consumer<StateModel>(
      builder: (context, state, child) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/app_icon.jpg',
                width: 300,
              ),
              const SizedBox(height: 20),
              const Text(
                "Outlander Quiz App",
                style: TextStyle(
                  color: Color(0xff536229),
                  fontSize: 26,
                ),
              ),
              const SizedBox(height:10),
              OutlinedButton.icon(
                icon: const Icon(Icons.arrow_right_alt_rounded),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xff536229),
                ),
                onPressed: state.startQuiz,
                label: const Text(
                  "Start the Quiz",
                  style: TextStyle(
                  fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
