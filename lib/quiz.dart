import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'start_screen.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  var activeScreen = 'Start-Screen';

  void switchScreen(){
    setState(() {
      activeScreen = 'Questions-Screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz App",
      debugShowCheckedModeBanner: false,
      home: Scaffold(appBar: AppBar(title: Center(child: Text("Daily Quiz",style: TextStyle(
        color: Colors.white,fontWeight: FontWeight.bold,
      ),)),
          backgroundColor: Color.fromARGB(255, 83, 54, 110)
      ),
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
            child: activeScreen == 'Start-Screen'
                ? StartScreen(switchScreen)
                : const QuestionsScreen(),
        ),
      ),
    );
  }
}
