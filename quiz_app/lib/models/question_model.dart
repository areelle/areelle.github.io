class QuizQuestion {
  const QuizQuestion (this.questionText, this.answersList);

  final String questionText;
  final List<String> answersList;

  List<String> getShuffledAnswersList(){
    final shuffledAnswersList = List.of(answersList);
    shuffledAnswersList.shuffle();
    return shuffledAnswersList;
  }

}