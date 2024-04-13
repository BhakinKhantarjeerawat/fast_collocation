import 'package:fast_collocation_dictionary/constants/app_sizes.dart';
import 'package:fast_collocation_dictionary/models/word.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final testList = ['1', '2'];

class WordDescriptionPage extends ConsumerStatefulWidget {
  const WordDescriptionPage({super.key, required this.word});
  final Word word;

  @override
  ConsumerState<WordDescriptionPage> createState() =>
      _WordDescriptionPageState();
}

class _WordDescriptionPageState extends ConsumerState<WordDescriptionPage> {
  final ExpansionTileController controller = ExpansionTileController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Word Description Page'),
      // ),
      body: Center(
        child: SingleChildScrollView(
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
                    // padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: WordDescriptionText('  ${widget.word.thWord}  ')),
                gapH32,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WordDescriptionText(widget.word.enWord, fontSize: 20),
                    const Text('  -  '),
                    WordDescriptionText(
                        widget.word.thVoice ?? 'no thai voice data',
                        fontSize: 20),
                  ],
                ),
                WordDescriptionText(widget.word.adjClc.toString(),
                    fontSize: 20),
                WordDescriptionText(widget.word.verbClc.toString(),
                    fontSize: 20),
                gapH16,
                MyExpansionTile(
                  context,
                  'adj',
                  children: [
                    widget.word.adjExample == null ||
                            widget.word.adjExample!.isEmpty
                        ? const Text('No adj example data')
                        : SizedBox(
                            height: 120,
                            child: ListView.builder(
                                itemCount: widget.word.adjExample!.length,
                                itemBuilder: (context, index) {
                                  final adjExample =
                                      widget.word.adjExample![index];
                                  return Text(adjExample);
                                }),
                          ),
                  ],
                ),
                MyExpansionTile(
                  context,
                  'verb',
                  children: [
                    widget.word.verbExample == null ||
                            widget.word.verbExample!.isEmpty
                        ? const Text('No verb example data')
                        : SizedBox(
                            height: 120,
                            child: ListView.builder(
                                itemCount: widget.word.verbExample!.length,
                                itemBuilder: (context, index) {
                                  final verbExample =
                                      widget.word.verbExample![index];
                                  return Text(verbExample);
                                }),
                          ),
                  ],
                ),
                gapH32,
                SizedBox(
                  width: 360,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 219, 251, 221)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('back')),
                ),
                gapH16,
                SizedBox(
                  width: 360,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 219, 251, 221)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('excercise')),
                ),
              ],
            )),
          ),
        ),
      ),
      // floatingActionButton: SizedBox(
      //   width: double.infinity,
      //   child: FloatingActionButton(onPressed: () {
      //     Navigator.pop(context);
      //   }),
      // ),
    );
  }
}

class WordDescriptionText extends StatelessWidget {
  const WordDescriptionText(
    this.word, {
    super.key,
    this.fontSize = 25,
  });
  final String word;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(word, style: TextStyle(fontSize: fontSize));
  }
}

class MyExpansionTile extends ConsumerWidget {
  const MyExpansionTile(this.context, this.title,
      {super.key, required this.children});
  final BuildContext context;
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ExpansionTile(
      title: Text(title),
      children: <Widget>[
        Builder(
          builder: (context) {
            return Container(
              color: const Color.fromARGB(255, 212, 246, 230),
              padding: const EdgeInsets.all(24),
              alignment: Alignment.center,
              child: Column(children: [
                ...children,
                ElevatedButton(
                    child: const Text('close'),
                    onPressed: () {
                      return ExpansionTileController.of(context).collapse();
                    }),
              ]),
            );
          },
        ),
      ],
    );
  }
}
