import 'package:fast_collocation_dictionary/constants/app_sizes.dart';
import 'package:fast_collocation_dictionary/constants/word_lists.dart';
import 'package:fast_collocation_dictionary/keyboard_provider.dart';
import 'package:fast_collocation_dictionary/models/word.dart';
import 'package:fast_collocation_dictionary/suggested_letter_provider.dart';
import 'package:fast_collocation_dictionary/widget/delete_icon_widget.dart';
import 'package:fast_collocation_dictionary/widget/my_key_board2.dart';
import 'package:fast_collocation_dictionary/widget/my_keyboard.dart';
import 'package:fast_collocation_dictionary/widget/searched_widget.dart';
import 'package:fast_collocation_dictionary/widget/typed_text_widget.dart';
import 'package:fast_collocation_dictionary/word_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dartx/dartx.dart';

class FilteredWords extends ConsumerWidget {
  const FilteredWords({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(keyboardProvider).toString();
    final List<Word> filteredWords = wordList
        .where((Word element) => element.abbreviation == value)
        .toList();
    if (filteredWords.isEmpty) {
      return const WordDescriptionText('ไม่พบคำที่ค้นหา');
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

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // final typedText = ref.watch(keyboardProvider).toString();
    final typedTextList = ref.watch(keyboardProvider);
    final suggestedLetter = ref.watch(suggestedLettersProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home Page'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
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
              if (typedTextList.toString().isNotEmpty)
                SizedBox(
                  height: 55,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => gapW16,
                    scrollDirection: Axis.horizontal,
                    // reverse: true,
                    itemCount: suggestedLetter.length,
                    itemBuilder: (context, index) {
                      final result = suggestedLetter[index];
                      return Center(
                        child: Center(
                          child: ElevatedButton(
                              onPressed: () {
                                if (typedTextList.length > 1) {
                                  ref.read(keyboardProvider.notifier).state =
                                      typedTextList.slice(0, -2) + result;
                                }
                              },
                              child: Text(result)),
                        ),
                      );
                    },
                  ),
                ),
//
              gapH16,
              MyTextInputWidget(value: typedTextList, ref: ref),
              gapH16,
              SizedBox(
                height: 216,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const MyKeyBoard(),
                      gapW8,
                      Container(
                          color: Colors.white, child: const MyKeyBoard2()),
                    ],
                  ),
                ),
              ),
              // const MyKeyBoard(),
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
          color: const Color.fromARGB(255, 202, 249, 203),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [TypedTextWidget(value: value), DeleteIconWidget(ref: ref)],
      ),
    );
  }
}
