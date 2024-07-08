import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/questions_statistics.dart';

// ignore: must_be_immutable
class ResultsScreen extends StatelessWidget {
  ResultsScreen(this.answers, this.goHome, {super.key});

  final void Function() goHome;
  final List<String> answers;

  var correctAnswers = 0;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < answers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].question,
        "correct_answer": questions[i].answers[0],
        "user_answer": answers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final correctAnswers = summaryData.where(
      (question) {
        return question["correct_answer"] == question["user_answer"];
      },
    );

    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You have answered ${correctAnswers.length} questions of ${questions.length} correctly.",
            style: GoogleFonts.abhayaLibre(fontSize: 25, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          QuestionsStatistics(summaryData),
          TextButton.icon(
            onPressed: goHome,
            style: TextButton.styleFrom(backgroundColor: Colors.white),
            icon: const Icon(Icons.restart_alt_outlined),
            label: const Text("Take a quiz again!"),
          )
        ],
      ),
    );
  }
}
