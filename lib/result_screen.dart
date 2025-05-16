import 'package:flutter/material.dart';
import 'package:quiz_app/questions_summary.dart';
import 'data/questions.dart';

class ResultScreen extends StatelessWidget {

  const ResultScreen({super.key,
  required this.selectedAnswers,
    required this.resetScreen,
  });

  final List<String> selectedAnswers;
  final void Function() resetScreen;

  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summary = [];
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
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              const Text("You Answered X out of Y Questions Correctly"),
            const SizedBox(height: 30,),
            QuestionsSummary(summaryData: getSummaryData()),
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
