import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.resultAnswers, this.switchScreen, {super.key});

  final List<String> resultAnswers;
  final void Function() switchScreen;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < resultAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'selected_answer': resultAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // final summaryData = summaryData;
    final numOfTotalQuestions = questions.length;
    final numOfCorrectQuestions = summaryData
        .where((item) => item['selected_answer'] == item['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'You answered $numOfCorrectQuestions out of $numOfTotalQuestions questions correctly!',
              style: const TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: switchScreen,
              icon: const Icon(
                Icons.restart_alt_outlined,
                color: Colors.white,
              ),
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              label: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
