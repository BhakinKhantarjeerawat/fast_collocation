import 'package:dartx/dartx.dart';
import 'package:fast_collocation_dictionary/keyboard_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'suggested_letter_provider.g.dart';

@riverpod
List<String> suggestedLetters(SuggestedLettersRef ref) {
  final typedTextList = ref.watch(keyboardProvider);
  if (typedTextList.isNotEmpty) {
    final lastLetter = typedTextList.slice(-1);

    switch (lastLetter) {
      // row1
      case 'ภ':
        return ['ถ'];
      case 'ถ':
        return ['ภ', 'ค'];
      case 'ค':
        return ['ถ', 'ต'];
      case 'จ':
        return ['ต', 'ข'];
      case 'ข':
        return ['จ', 'ช'];
      case 'ช':
        return ['ข'];
      // row2
      case 'พ':
        return ['ร'];
      case 'ร':
        return ['พ', 'น'];
      case 'น':
        return ['ร', 'ย'];
      case 'ย':
        return ['น', 'บ'];
      case 'บ':
        return ['ย', 'ล'];
           case 'ล':
        return ['บ'];

      // row3
      case 'ฟ':
        return ['ห'];
      case 'ห':
        return ['ฟ', 'ก'];
      case 'ก':
        return ['ห', 'ด'];
      case 'ส':
        return ['ด', 'ว'];
      case 'ว':
        return ['ส', 'ง'];
      case 'ง':
        return [ 'ว'];
      // row4
      case 'ผ':
        return ['ป'];
      case 'ป':
        return ['ผ', 'อ'];
      case 'อ':
        return ['ป', 'ท'];
      case 'ท':
        return ['อ', 'ม'];
           case 'ม':
        return ['ท', 'ฝ'];
      case 'ฝ':
        return ['ม'];
      default:
        return [];
    }
  } else {
    return [];
  }
}
