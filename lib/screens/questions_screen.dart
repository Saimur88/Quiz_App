import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import '../widgets/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {


  var currentQuesIndex = 0;

  void answerQuestion(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuesIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {

    final currentQuestion = questions[currentQuesIndex]; //Access the questions.dart file
    // and get the current question

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              currentQuestion.text,
              style:GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30,),
            ...currentQuestion.getShuffledAnswers().map((answer){ //... is used to spread the list/
              // broke the items in the list
              return AnswerButton(answerText: answer,
                onTap:(){
                answerQuestion(answer); //after clicking on any answer the answerQuestion function is called
                },
              );
            }),
        
          ],
        ),
      ),
    );

  }
}
