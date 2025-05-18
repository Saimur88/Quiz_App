import 'package:flutter/material.dart';
import 'package:quiz_app/models/styled_text.dart';
import 'models/styled_text.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key,required this.summaryData});

  final List<Map<String, Object>> summaryData; //receives summaryData from result_screen.dart

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data){
            final isCorrectAnswer = data['is_correct_answer'] as bool? ?? false;
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Container(
                  height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isCorrectAnswer ? Colors.cyan : Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(100)
                    ),
                    child: StyledText(
                        color:isCorrectAnswer ? Colors.black87 : Colors.white,
                        size: 15,
                        text: ((data['question_index'] as int) +1 ).toString())
                ),
                const SizedBox(width: 20,),
                Expanded(  //resizes the text to fit the screen
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StyledText(
                          color: Colors.white,
                          size: 17,
                          text: data['question'] as String),
                      SizedBox(height: 5,),
                      StyledText(color: isCorrectAnswer ? Colors.green : Colors.pinkAccent,
                          size: 14,
                          text: data['user_answer'] as String),
                      SizedBox(height: 5,),
                      StyledText(
                          color: isCorrectAnswer ? Colors.white : Colors.green,
                          size: 14,
                          text: data['correct_answer'] as String),
                    ],
                  ),
                ),
              ]

            );
          }).toList(),
        ),
      ),
    );
  }
}
