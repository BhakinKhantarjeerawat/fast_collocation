import 'package:fast_collocation_dictionary/common_methods.dart/my_navigate.dart';
import 'package:fast_collocation_dictionary/common_methods.dart/show_bottom_sheet.dart';
import 'package:fast_collocation_dictionary/constants/app_sizes.dart';
import 'package:fast_collocation_dictionary/excercise_page.dart';
import 'package:fast_collocation_dictionary/models/word.dart';
import 'package:fast_collocation_dictionary/widget/word_desc_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      // appBar: AppBar(
      //   title: const Text('Word Description Page'),
      // ),
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
                        'assets/images/${widget.word.enWord}.png')),
              ),
              gapH12,
              Card(
                  elevation: 0,
                  color: const Color.fromARGB(255, 201, 247, 205),
                  child: WordDescText('  ${widget.word.thWord}  ')),
              gapH32,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WordDescText(widget.word.enWord, fontSize: 25),
                  const Text('  -  '),
                  WordDescText(widget.word.thVoice ?? 'no thai voice data',
                      fontSize: 25),
                ],
              ),
              gapH16,
              Container(
                width: double.infinity,
                color: const Color.fromARGB(255, 215, 250, 217),
                child: Wrap(children: [
                  ...widget.word.adjClc!
                      .map((e) => Tooltip(
                            message: e,
                            textStyle: const TextStyle(fontSize: 30),
                            child:
                                TextButton(onPressed: () {}, child: Text(e)),
                          ))
                      .toList()
                ]),
              ),
              gapH16,
              Container(
                width: double.infinity,
                color: const Color.fromARGB(255, 215, 250, 217),
                child: Wrap(children: [
                  ...widget.word.verbClc!
                      .map((e) => Tooltip(
                            message: e,
                            textStyle: const TextStyle(fontSize: 20),
                            child: TextButton(
                                onPressed: () {
                                  myBottomSheet(context);
                                },
                                child: Text(e)),
                          ))
                      .toList()
                ]),
              ),
              gapH32,
              ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('back')),
              gapH16,
              ElevatedButton(
                  onPressed: () =>
                      myNavigate(context, const ExecercisePage()),
                  child: const Text('excercise')),
            ],
          )),
        ),
      ),
    );
  }
}
