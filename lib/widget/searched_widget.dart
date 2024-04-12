import 'package:fast_collocation_dictionary/constants/app_sizes.dart';
import 'package:fast_collocation_dictionary/models/word.dart';
import 'package:fast_collocation_dictionary/word_description.dart';
import 'package:flutter/material.dart';

class SearchedWidget extends StatelessWidget {
  const SearchedWidget({super.key, required this.word});
  final Word word;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WordDescriptionPage(word: word))),
      child: Column(
        children: [
          Hero(
            tag: word.enWord,
            child: CircleAvatar(
                radius: 45,
                child: Image.asset('assets/images/${word.enWord}.png')),
          ),
          gapH4,
          // Text(word.enWord),
        ],
      ),
    );
  }
}
