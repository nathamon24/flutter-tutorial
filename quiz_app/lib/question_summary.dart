import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    minRadius: 15,
                    // maxRadius: 75,
                    backgroundColor:
                        data['selected_answer'] == data['correct_answer']
                            ? Colors.blue[50]
                            : Colors.pink[100],
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
               
                      children: [
                        Text(
                          (data['question'] as String),
                          style: const TextStyle(color: Colors.white,fontSize: 16),
                        ),
                        const SizedBox(height: 5,),
                        Text(
                          (data['selected_answer'] as String),
                          style: const TextStyle(color: Colors.pinkAccent),
                        ),
                        Text(
                          (data['correct_answer'] as String),
                          style: const TextStyle(color: Colors.blueAccent),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
