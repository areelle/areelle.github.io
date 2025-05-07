import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:quiz_app/models/question_model.dart';

class StateModel extends ChangeNotifier {
  
  final List<QuizQuestion> _questions = [
  QuizQuestion("In what year did Jamie & Claire first meet?",
  [
    '1743',
    '1742',
    '1741',
    '1744',
  ]),
  QuizQuestion("How many years were Jamie & Claire separated for?",
  [
    '20 years',
    '10 years',
    '15 years',
    '5 years',
  ]),
  QuizQuestion("Which of the following is not one of Jamie's middle names?",
  [
    'Grant',
    'Malcolm',
    'Mackenzie',
    'Alexander',
  ]),
  QuizQuestion("What is the name of Claire and Brianna's dog?",
  [
    'Smokey',
    'Blackie',
    'Bluey',
    'Goldie',
  ]),
  QuizQuestion("When is Claire's birthday?",[
    'October 20th 1918',
    'October 22nd 1916',
    'October 21st 1918',
    'October 19th 1917',
  ]),  
  QuizQuestion("As of Go Tell the Bees That I Am Gone, how many children do Fergus and Marsali have?",[
    '6',
    '5',
    '3',
    '1',
  ]),
  QuizQuestion("How many siblings did Jamie have?",[
    '3',
    '2',
    '1',
    '4',
  ]),
  QuizQuestion("Where did Jamie and Claire first arrive in when they reached America?",[
    'Georgia',
    'North Carolina',
    'Virginia',
    'New York',
  ]),  
];
  List<String> _answers = [];
  int currentQuestion = 0;
  String _status = "start";

  StateModel() {
      resetQuiz();
  }

  UnmodifiableListView<QuizQuestion> get questions => UnmodifiableListView(_questions);
  UnmodifiableListView<String> get answeres => UnmodifiableListView(_answers);

  int get currentQuestionNumber => currentQuestion + 1;

  String get quizStatus => _status;

  void resetQuiz() {
    currentQuestion = 0;
    _status = "start";
    resetAnswers();
    notifyListeners();
  }

  void startQuiz() {
    _status = "in-progress";
    notifyListeners();
  }

  QuizQuestion getCurrentQuestion() {
    if (currentQuestion < _questions.length) {
      return _questions[currentQuestion];
    } else {
      // return a null question since we don't have any
      return const QuizQuestion('', []);
    }
  }

  void advanceQuestion(){
    if(++currentQuestion >= _questions.length){
      _status = "complete";
      notifyListeners();
    }
  }

  void add(QuizQuestion q) {
    _questions.add(q);
    notifyListeners();
  }

  void addAnswer(String answer) {
    _answers[currentQuestion] = answer;
    notifyListeners();
  }

  void resetAnswers() {
    _answers = List<String>.filled(_questions.length, "");
  }

List<Map<String,Object>> getSummaryData(){
  List<Map<String,Object>> summaryData = [];

  for(var i = 0; i < _answers.length; i++){
    summaryData.add({
      'questionIndex': i,
      'question': _questions[i].questionText,
      'correctAnswer': _questions[i].answersList[0],
      'chosenAnswer': _answers[i],
    });
  }
  return summaryData;
}
}