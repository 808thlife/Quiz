import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerText, this.onTap, {super.key});
  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          //padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 10),
          backgroundColor: const Color.fromARGB(255, 109, 60, 118),
          foregroundColor: Colors.white),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
