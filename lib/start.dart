import "package:flutter/material.dart";

class StartBody extends StatelessWidget {
  const StartBody(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/images/quiz-logo.png",
              color: const Color.fromARGB(144, 183, 167, 233)),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Container(
              padding: const EdgeInsets.all(0.0),
              width: 80.0,
              height: 80.0,
            ),
          ),
          const Text("Start quzzing with Flutter!"),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Container(
              padding: const EdgeInsets.all(0.0),
              width: 80.0,
              height: 20.0,
            ),
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: ButtonStyle(
              padding: WidgetStateProperty.all<EdgeInsets>(
                const EdgeInsets.all(10.0),
              ),
              backgroundColor: WidgetStateProperty.all<Color>(
                const Color.fromARGB(255, 93, 202, 200),
              ),
            ),
            icon: const Icon(Icons.start_rounded),
            label: const Text(
              "Start playing with it!",
              style: TextStyle(color: Color.fromARGB(255, 18, 17, 0)),
            ),
          )
        ],
      ),
    );
  }
}
