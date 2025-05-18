import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/questions_summary.dart';
import '../data/questions.dart';

class ResultScreen extends StatelessWidget {

  const ResultScreen({super.key,
  required this.selectedAnswers,
    required this.resetScreen,
  });

  final List<String> selectedAnswers; //gets selectedAnswers list from quiz.dart
  final void Function() resetScreen; //stores and calls the restartQuiz function from quiz.dart

  List<Map<String, Object>> getSummaryData(){

    final List<Map<String, Object>> summary = []; //stores the summary data

    for (var i = 0; i < selectedAnswers.length; i++){
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {

    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data){
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
               Text("You Answered $numCorrectQuestions out of $numTotalQuestions Questions Correctly"),
            const SizedBox(height: 30,),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(height: 30,),
            TextButton(
                onPressed: (){
                  resetScreen();
                },
                child: const Text("Restart Quiz"))
          ],
        ),
      ),
    );
  }
}
