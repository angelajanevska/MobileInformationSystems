import 'package:flutter/material.dart';

class QuestionChoice extends StatelessWidget {
  final String _choiceText;
  final VoidCallback _callBack;

  const QuestionChoice(this._callBack, this._choiceText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
        onPressed: _callBack,
        child: Text(_choiceText,style: const TextStyle(
          fontSize: 20,
          color: Colors.red,
        ),),
      ),
    );
  }
}
