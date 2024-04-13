import 'package:flutter/material.dart';

class WordDescText extends StatelessWidget {
  const WordDescText(
    this.word, {
    super.key,
    this.fontSize = 25,
  });
  final String word;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(word, style: TextStyle(fontSize: fontSize));
  }
}
