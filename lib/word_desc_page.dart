import 'package:fast_collocation_dictionary/common_methods.dart/my_bottom_sheet.dart';
import 'package:fast_collocation_dictionary/constants/app_sizes.dart';
import 'package:fast_collocation_dictionary/models/word.dart';
import 'package:fast_collocation_dictionary/providers/tts_provider.dart';
import 'package:fast_collocation_dictionary/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

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
                    child:
                        Image.asset('assets/images/${widget.word.enWord}.png')),
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
              Container(
                  width: double.infinity,
                  height: 50,
                  color: const Color.fromARGB(255, 215, 250, 217),
                  child: widget.word.adjClc!.length < 2
                      ? const SizedBox()
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.word.adjClc!.length,
                          itemBuilder: (context, index) {
                            final adjWord = widget.word.adjClc![index];
                            return Tooltip(
              
                              decoration: const BoxDecoration(
                                  color: Colors.orangeAccent),
                              message: adjWord,
                              textStyle: const TextStyle(fontSize: 25),
                              child: GestureDetector(
                                onDoubleTap: () {
                                  ref.read(ttsProvider).setLanguage("en-US");
                                  ref
                                      .read(ttsProvider)
                                      .speak(adjWord + widget.word.enWord);
                                },
                                child: TextButton(
                                    onPressed: () {
                                      ref
                                          .read(ttsProvider)
                                          .setLanguage("en-US");
                                      ref.read(ttsProvider).speak(adjWord);
                                      myBottomSheet(
                                          context, widget.word.enWord, adjWord);
                                    },
                                    child: Text(adjWord)),
                              ),
                            );
                          },
                        )

                  // Wrap(children: [
                  //   ...widget.word.adjClc!
                  //       .map((e) => Tooltip(
                  //             message: e,
                  //             textStyle: const TextStyle(fontSize: 30),
                  //             child: TextButton(onPressed: () {}, child: Text(e)),
                  //           ))
                  //       .toList()
                  // ]),
                  ),
              gapH16,
              // verb examples
              Container(
                  width: double.infinity,
                  height: 50,
                  color: const Color.fromARGB(255, 215, 250, 217),
                  child: widget.word.adjClc!.length < 2
                      ? const SizedBox()
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.word.verbClc!.length,
                          itemBuilder: (context, index) {
                            final verbWord = widget.word.verbClc![index];
                            return Tooltip(
                              message: verbWord,
                              textStyle: const TextStyle(fontSize: 20),
                              child: TextButton(
                                  onPressed: () {
                                    myBottomSheet(
                                        context, widget.word.enWord, verbWord);
                                  },
                                  child: Text(verbWord)),
                            );
                          },
                        )

                  // Wrap(children: [
                  //   ...widget.word.adjClc!
                  //       .map((e) => Tooltip(
                  //             message: e,
                  //             textStyle: const TextStyle(fontSize: 30),
                  //             child: TextButton(onPressed: () {}, child: Text(e)),
                  //           ))
                  //       .toList()
                  // ]),
                  ),
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
              gapH48,
              gapH48,
              gapH48
            ],
          )),
        ),
      ),
    );
  }
}
