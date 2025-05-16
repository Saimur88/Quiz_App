import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {

  const ResultScreen({super.key,required this.onPressed,});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              const Text("You Answerd X out of Y Questions Correctly"),
            const SizedBox(height: 30,),
            const Text("list"),
            const SizedBox(height: 30,),
            TextButton(
                onPressed: (){
                  onPressed();
                },
                child: const Text("Restart Quiz"))
          ],
        ),
      ),
    );
  }
}
