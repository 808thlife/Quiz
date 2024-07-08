import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsStatistics extends StatelessWidget {
  const QuestionsStatistics(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (question) {
              return Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (question["correct_answer"] ==
                              question["user_answer"])
                          ? const Color.fromARGB(255, 61, 234, 202)
                          : const Color.fromARGB(255, 223, 43, 43),
                    ),
                    child: Center(
                      child: Text(
                        ((question["question_index"] as int) + 1).toString(),
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (question["question"]).toString(),
                          style: GoogleFonts.alfaSlabOne(
                              fontSize: 15,
                              color: const Color.fromARGB(255, 255, 255, 255)),
                        ),
                        Text(
                          (question["correct_answer"]).toString(),
                          style: GoogleFonts.calistoga(
                            fontSize: 15,
                            color: const Color.fromARGB(255, 87, 151, 89),
                          ),
                        ),
                        Text(
                          (question["user_answer"]).toString(),
                          style: GoogleFonts.calistoga(
                            fontSize: 15,
                            color: const Color.fromARGB(255, 115, 233, 223),
                          ),
                        )
                      ],
                    ),
                  )
                ], //Children
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
