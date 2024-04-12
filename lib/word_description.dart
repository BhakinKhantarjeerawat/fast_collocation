import 'package:fast_collocation_dictionary/constants/app_sizes.dart';
import 'package:fast_collocation_dictionary/models/word.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WordDescriptionPage extends ConsumerWidget {
  const WordDescriptionPage({super.key, required this.word});
  final Word word;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Word Description Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
              child: Column(
            children: [
              gapH16,
              Hero(
                tag: word.enWord,
                child:
              Image.asset('assets/images/${word.enWord}.png'),

                //  CircleAvatar(
                //     radius: 90,
                //     child: Image.asset('assets/images/${word.enWord}.png')),
              ),
              // Image.asset('assets/images/${word.enWord}.png'),
              gapH16,
              Text(word.abbreviation),
              Text(word.enWord),
              Text(word.thWord),
              Text(word.meaning ?? 'no meaning data'),
              Text(word.thVoice ?? 'no thai voice data'),
              Text(word.verbClc.toString()),
            ],
          )),
        ));
  }
}
