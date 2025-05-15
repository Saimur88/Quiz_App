import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {

  final String answerText;
  final Function() onTap;

  const AnswerButton({
    required this.answerText,
    required this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 33, 1, 95),
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40)
        ),
        onPressed: onTap,
        child: Text(answerText,
        textAlign: TextAlign.center,));
  }
}
