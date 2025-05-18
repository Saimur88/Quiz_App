import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key,required this.summaryData});

  final List<Map<String, Object>> summaryData; //receives summaryData from result_screen.dart

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map((data){
        return Row(
          children: [
            Text(((data['question_index'] as int) +1 ).toString()),
            Expanded(  //resizes the text to fit the screen
              child: Column(
                children: [
                  Text(data['question'] as String),
                  SizedBox(height: 5,),
                  Text(data['user_answer'] as String),
                  SizedBox(height: 5,),
                  Text(data['correct_answer'] as String),
                ],
              ),
            ),
          ]

        );
      }).toList(),
    );
  }
}
