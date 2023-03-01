import 'package:flutter/material.dart';

class ClothingAnswer extends StatelessWidget {
  final String _answerText;
  final VoidCallback _tapped;
  const ClothingAnswer(this._tapped, this._answerText, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _tapped,
      child: Text(
        _answerText,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.red,
        ),
      ),
    );
  }
}
