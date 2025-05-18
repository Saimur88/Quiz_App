class QuizQuestion {
 const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

   List<String> getShuffledAnswers(){  //Made to shuffle the answers
   final shuffledList = List.of(answers);
   shuffledList.shuffle();
   return shuffledList; //Returns the shuffled list
  }

}