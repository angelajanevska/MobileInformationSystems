import 'package:flutter/material.dart';

import './clothing_question.dart';
import './question_choice.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  void iWasTapped() => print('I was tapped');
  var questions = [
    {
      "question": "What type of clothing do you like?",
      "answers": [
        "T-shirt",
        "Jeans",
        "Sneakers",
      ],
    },
    {
      "question": "What kind of material do you prefer?",
      "answers": [
        "Cotton",
        "Synthetics",
        "Leather",
      ],
    },
    {
      "question": "Do you want pattern or plain design?",
      "answers": [
        "Pattern design",
        "Plain design",
      ]
    }
  ];
  var _questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      if (_questionIndex < questions.length - 1) {
        _questionIndex += 1;
      } else {
        _questionIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Angela Janevska 193116",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Angela Janevska 193116"),
        ),
        body: Column(
          children: [
            ClothingQuestion(questions[_questionIndex]['question'] as String),
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
              return QuestionChoice(
                _answerQuestion,
                answer,
              );
            })
          ],
        ),
      ),
    );
  }
}
