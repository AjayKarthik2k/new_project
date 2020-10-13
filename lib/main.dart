import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questions = [
    {
      'questionText': 'Who developed flutter?',
      'answers': [
        {'option': 'Google', 'score': 1},
        {'option': 'Facebook', 'score': 0},
        {'option': 'Microsoft', 'score': 0}
      ],
    },
    {
      'questionText': "Who developed react native?",
      'answers': [
        {'option': 'Google', 'score': 0},
        {'option': 'Facebook', 'score': 1},
        {'option': 'Microsoft', 'score': 0}
      ],
    },
    {
      'questionText': 'Who developed IONIC?',
      'answers': [
        {'option': 'Ion', 'score': 1},
        {'option': 'Facebook', 'score': 0},
        {'option': 'Oracle', 'score': 0}
      ],
    },
    {
      'questionText': 'Who developed BackToWork?',
      'answers': [
        {'option': 'Zoho', 'score': 1},
        {'option': 'FreshWorks', 'score': 0},
        {'option': 'Salesforce', 'score': 0}
      ],
    },
    {
      'questionText': 'Who developed Dart?',
      'answers': [
        {'option': 'Facebook', 'score': 0},
        {'option': 'Zoho', 'score': 0},
        {'option': 'Google', 'score': 1},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  // resetting the quiz when button is pressed
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  // executes only when any of the buttons is pressed
  void _answerQuestion(int score) {
    _totalScore += score;

    // responsible for changing the options and re-render into the screen
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
