import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/models/state.dart';
import 'package:quiz_app/screens/questions_screen/app_answer_button.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key});

  @override
  Widget build(context) {
  return Consumer<StateModel>(
    builder: (context, state, child){
    
    var currentQuestion = state.getCurrentQuestion(); //now gets this from the current state
    var answerNumber = 0;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin:EdgeInsets.all(60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Question ${state.currentQuestionNumber}",
              style: const TextStyle(
                color: Color.fromARGB(255, 56, 56, 56),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              currentQuestion.questionText,
              style: const TextStyle(
                color: Color.fromARGB(255, 56, 56, 56),
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
              key: const Key('question-text'),
            ),
            const SizedBox(height: 30),
            ... currentQuestion.getShuffledAnswersList().map((answer) {
              return AnswerButton(
                answerText: answer, 
                key: Key('answer-button-${answerNumber++}'),
                onAnswerSelect: () {
                  state.addAnswer(answer);
                  state.advanceQuestion();
                }
              );
            }
        ),
          ],
        ),
      ),
    );
  });
  }
}