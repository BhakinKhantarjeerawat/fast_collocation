import 'package:fast_collocation_dictionary/constants/app_sizes.dart';
import 'package:fast_collocation_dictionary/keyboard_provider.dart';
import 'package:fast_collocation_dictionary/models/word.dart';
import 'package:fast_collocation_dictionary/widget/delete_icon_widget.dart';
import 'package:fast_collocation_dictionary/widget/my_keyboard.dart';
import 'package:fast_collocation_dictionary/widget/searched_widget.dart';
import 'package:fast_collocation_dictionary/widget/typed_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Word> wordList = [
  Word('ตถ', 'ต้นถั่ว', 'bean_stalk'),
  Word('ปฟ', 'แปรงฟัน', 'tooth_brush'),
  Word('ปฟ', 'ถั่วเหลือง', 'soy'),
  Word('ปฟ', 'ราเม็น', 'ramen'),
  Word('ปฟ', 'ราเม็น', 'instant_noodles'),
  Word('ปฟ', 'แปรงฟัน', 'tooth_brush'),
  Word('ปฟ', 'ถั่วเหลือง', 'soy'),
  Word('ปฟ', 'ราเม็น', 'ramen'),
  Word('ปฟ', 'ราเม็น', 'instant_noodles'),
  Word('ปฟ', 'ราเม็น', 'ramen'),
  Word('ปฟ', 'ราเม็น', 'instant_noodles'),
  Word('ปฟ', 'แปรงฟัน', 'tooth_brush'),
  Word('ปฟ', 'ถั่วเหลือง', 'soy'),
  Word('ปฟ', 'ราเม็น', 'ramen'),
  Word('ปฟ', 'ราเม็น', 'instant_noodles'),
];

class FilteredWords extends ConsumerWidget {
  const FilteredWords({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(keyboardProvider).toString();
    final List<Word> filteredWords = wordList
        .where((Word element) => element.abbreviation == value)
        .toList();
    if (filteredWords.isEmpty) {
      return const Text('No word matched the search');
    } else {
      return Column(
        children: [
          Container(
              color: Colors.blue,
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


class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final value = ref.watch(keyboardProvider).toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: <Widget>[
              // Wrap(
              //   spacing: 20,
              //   runSpacing: 10,
              //   children: [
              //     // ...where((e) => e.abrrviation == value)
              //     ...extraColor,

              //   ],
              // ),
              const FilteredWords(),
              const Spacer(),
              MyTextInputWidget(value: value, ref: ref),
              gapH16,
              const MyKeyBoard(),
              gapH16,
            ],
          ),
        ),
      ),
    );
  }
}

class MyTextInputWidget extends StatelessWidget {
  const MyTextInputWidget({
    super.key,
    required this.value,
    required this.ref,
  });

  final String value;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          TypedTextWidget(value: value),
          DeleteIconWidget(ref: ref)
        ],
      ),
    );
  }
}




