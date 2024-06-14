import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/home.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/result.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  //editing
  List<String> _selectedAnswers = [];
  var activeScreen = 'home-screen';

// @override
//   void initState() {
//     activeScreen = HomeScreen(switchScreen);
//     super.initState();
//   }

  void switchScreen() {
    setState(() {
      if (activeScreen == 'home-screen') {
        activeScreen = 'questions-screen';
      } else {
        activeScreen = 'home-screen';
        _selectedAnswers = [];
      }
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = HomeScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(chooseAnswer);
    } else if (activeScreen == 'home-screen') {
      screenWidget = HomeScreen(switchScreen);
    } else if (activeScreen == 'result-screen') {
      screenWidget = ResultsScreen(_selectedAnswers, switchScreen);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.deepPurpleAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
