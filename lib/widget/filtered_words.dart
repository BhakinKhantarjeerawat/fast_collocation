import 'package:fast_collocation_dictionary/constants/word_lists.dart';
import 'package:fast_collocation_dictionary/keyboard_provider.dart';
import 'package:fast_collocation_dictionary/models/word.dart';
import 'package:fast_collocation_dictionary/widget/searched_widget.dart';
import 'package:fast_collocation_dictionary/widget/word_desc_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilteredWords extends ConsumerWidget {
  const FilteredWords({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(keyboardProvider).toString();
    final List<Word> filteredWords = wordList
        .where((Word element) => element.abbreviation == value)
        .toList();
    if (filteredWords.isEmpty) {
      return const WordDescText('ไม่พบคำที่ค้นหา');
    } else {
      return Column(
        children: [
          Container(
              color: const Color.fromARGB(255, 169, 231, 171),
              height: 390,
              child: GridView.builder(
                itemCount: filteredWords.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final word = filteredWords[index];
                  return SearchedWidget(word: word);
                },
              )),
          filteredWords.length > 9
              ? const Text('เลื่อนลงได้')
              : const SizedBox()
        ],
      );
    }
  }
}