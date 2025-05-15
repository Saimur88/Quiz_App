import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/quiz-logo.png',
              width: 250,
            color: Color.fromARGB(150, 255, 255, 255),
            ),
            const SizedBox(height: 80,),
            const Text("Learn Flutter The Fun Way",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),),
            const SizedBox(height: 30,),

            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                 foregroundColor: Colors.white,
              ),
                icon: Icon(Icons.arrow_back),
                onPressed: startQuiz,
                label: const Text("Start Quiz",)),
          ],
        ));
  }
}

