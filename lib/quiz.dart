import "package:flutter/material.dart";
import "package:quiz/question.dart";
import "package:quiz/results_screen.dart";
import "package:quiz/start.dart";
import "package:quiz/data/questions.dart";

//IT IS MAIN FILE WHERE EVERYTHING IS RENDERED THROUGH.

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  Widget? activeScreen;
  @override
  void initState() {
    activeScreen = StartBody(switchScreen);
    super.initState();
  }

  void switchScreen() {
    //for interactive start quiz button
    setState(() {
      activeScreen = QuestionsScreen(chooseAnswer);
    });
  }

  void goToHomeScreen() {
    setState(() {
      selectedAnswers.clear(); // to avoid out of range errors.
      activeScreen = StartBody(switchScreen);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(selectedAnswers, goToHomeScreen);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color.fromARGB(255, 72, 118, 212),
                Color.fromARGB(202, 136, 55, 150),
              ],
            ),
          ),
          child: Center(
            child: activeScreen,
          ),
        ),
      ),
    );
  }
}
