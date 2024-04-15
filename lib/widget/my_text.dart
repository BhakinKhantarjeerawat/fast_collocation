import 'package:fast_collocation_dictionary/providers/tts_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyText extends ConsumerWidget {
  const MyText(
    this.word, {
    super.key,
    this.fontSize = 25,
  });
  final String word;
  final double fontSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        await ref.read(ttsProvider).setLanguage("en-US");
         ref.read(ttsProvider).speak(word);},
      child: Text(word, style: TextStyle(fontSize: fontSize)));
  }
}
