import 'package:flutter/material.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'screens/start_screen.dart';
import 'data/questions.dart';
import 'screens/result_screen.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
 List<String> selectedAnswers = []; //stores the selected answers
  var activeScreen = 'Start-Screen';

  void switchScreen(){              //Made to execute when start button is pressed
    setState(() {
      activeScreen = 'Questions-Screen';
    });
  }


  void chooseAnswer(String answer){ //calling this function from questions_screen.dart from onSelectAnswer

    selectedAnswers.add(answer); //stores answers provided by onSelectAnswer into selectedAnswers

    if (selectedAnswers.length == questions.length){
      //selectedAnswers = [];
      setState(() {
        activeScreen = 'Result-Screen';
      });
    }
  }

 void restartQuiz (){
   selectedAnswers = [];
   setState(() {
     activeScreen = 'Start-Screen';  //Made The current screen to start screen
   });
 }

  @override
  Widget build(BuildContext context) {

    Widget screenWidget =  StartScreen(switchScreen);

    if (activeScreen == 'Questions-Screen'){
      screenWidget = QuestionsScreen( onSelectAnswer: chooseAnswer,);
    }

    if (activeScreen == 'Result-Screen'){
      screenWidget = ResultScreen(selectedAnswers: selectedAnswers,resetScreen: restartQuiz,);
    }


    return MaterialApp(
      title: "Quiz App",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors:[
                Colors.deepPurple,
                Colors.indigo,
              ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: screenWidget,
        ),
      ),
    );
  }
}
