import 'package:fast_collocation_dictionary/common_methods.dart/my_bottom_sheet.dart';
import 'package:fast_collocation_dictionary/constants/app_sizes.dart';
import 'package:fast_collocation_dictionary/vocabs/meaning_map.dart';
import 'package:fast_collocation_dictionary/vocabs/voice_map.dart';
import 'package:fast_collocation_dictionary/models/word.dart';
import 'package:fast_collocation_dictionary/providers/tts_provider.dart';
import 'package:fast_collocation_dictionary/widget/my_text.dart';
import 'package:fast_collocation_dictionary/widget/searched_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

enum WordType { adj, verb, objVerb }

String showMeaningAndVoice(String word) {
  if (voiceMap[word] != null && meaningMap[word] != null) {
    return '${voiceMap[word]!} | ${meaningMap[word]!}';
  } else {
    return 'No meaning and word data';
  }
}

class WordDescPage extends ConsumerStatefulWidget {
  const WordDescPage({super.key, required this.word});
  final Word word;

  @override
  ConsumerState<WordDescPage> createState() => _WordDescPageState();
}

class _WordDescPageState extends ConsumerState<WordDescPage> {
  final ExpansionTileController controller = ExpansionTileController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Word Description Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
              child: Column(
            children: [
              gapH32,
              Hero(
                tag: widget.word.enWord,
                child: CircleAvatar(
                    radius: 110,
                    child: Image.asset(
                        'assets/images/${addUnderscore(widget.word.enWord)}.png')),
              ),
              gapH12,
              Card(
                  elevation: 0,
                  color: const Color.fromARGB(255, 201, 247, 205),
                  child: MyText('  ${widget.word.thWord}  ')),
              gapH32,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: MyText(widget.word.enWord, fontSize: 25)),
                  const Text('  -  '),
                  GestureDetector(
                    onTap: () {
                      // TODO: textToSpeech
                    },
                    child: MyText(
                      widget.word.thVoice ?? 'no thai voice data',
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              gapH16,
              // adj examples
              ClcListWidget(word: widget.word, wordType: WordType.adj),
              // test
              gapH16,
              ClcListWidget(word: widget.word, wordType: WordType.verb),
              gapH16,
              if (widget.word.objectVerbClc != null )    ClcListWidget(word: widget.word, wordType: WordType.objVerb),
              gapH32,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('back')),
                  gapW16,
                  ElevatedButton(
                      onPressed: () {
                        // myNavigate(context, const ExecercisePage()
                        final box = GetStorage();
                        // final learntWord = box.read('learntWords');
                        box.write('learntWords', 'b');
                      },
                      child: const Text('excercise')),
                ],
              ),
              // gapH48,
              // gapH48,
              // gapH48
            ],
          )),
        ),
      ),
    );
  }
}

class ClcListWidget extends ConsumerWidget {
  const ClcListWidget({super.key, required this.word, required this.wordType});
  final Word word;
  final WordType wordType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        width: double.infinity,
        height: 65,
        color: const Color.fromARGB(255, 215, 250, 217),
        child: word.adjClc!.length < 2
            ? const SizedBox()
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: wordType == WordType.adj
                    ? word.adjClc!.length
                    : wordType == WordType.verb
                        ? word.verbClc!.length
                        : word.objectVerbClc!.length,
                itemBuilder: (context, index) {
                  final resultWord = wordType == WordType.adj
                      ? word.adjClc![index]
                      : wordType == WordType.verb
                          ? word.verbClc![index]
                          : word.objectVerbClc![index];
                  return Tooltip(
                    message: showMeaningAndVoice(resultWord),
                    showDuration: const Duration(seconds: 5),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 249, 192, 116)),
                    textStyle: const TextStyle(fontSize: 25),
                    child: GestureDetector(
                      onDoubleTap: () async {
                        await ref.read(ttsProvider).setLanguage("en-US");
                        await ref
                            .read(ttsProvider)
                            .speak(wordType == WordType.adj
                                ? resultWord + word.enWord
                                : wordType == WordType.verb
                                    ? resultWord + word.enWord
                                    : word.enWord + resultWord);
                      },
                      child: TextButton(
                          onPressed: () {
                            ref.read(ttsProvider).setLanguage("en-US");
                            ref.read(ttsProvider).speak(resultWord);
                            myBottomSheet(context, word.enWord, resultWord);
                          },
                          child: Text(
                            resultWord,
                            style: const TextStyle(fontSize: 20),
                          )),
                    ),
                  );
                },
              ));
  }
}
