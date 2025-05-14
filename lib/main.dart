import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
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
            child: StartScreen()),
      ),
    );
  }
}
