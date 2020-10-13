import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final finalScore;
  final Function resetQuizFunction;
  Result(this.finalScore, this.resetQuizFunction);

  String get resultPhrase {
    var resultText;
    if (finalScore == 5) {
      resultText = 'All are correct!';
    } else if (finalScore == 4) {
      resultText = 'Four are correct';
    } else if (finalScore == 3) {
      resultText = 'Three are correct!';
    } else if (finalScore == 2) {
      resultText = 'Two are correct!';
    } else if (finalScore == 1) {
      resultText = 'Only one is correct!';
    } else {
      resultText = 'Nothing is correct :( \n Better luck next time!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        FlatButton(
          child: Text("RESET QUIZ"),
          onPressed: resetQuizFunction,
        ),
      ],
    );
  }
}
