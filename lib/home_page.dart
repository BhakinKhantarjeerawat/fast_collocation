import 'package:fast_collocation_dictionary/constants/app_sizes.dart';
import 'package:fast_collocation_dictionary/providers/keyboard_provider.dart';
import 'package:fast_collocation_dictionary/widget/delete_icon_widget.dart';
import 'package:fast_collocation_dictionary/widget/filtered_words.dart';
import 'package:fast_collocation_dictionary/widget/my_key_board2.dart';
import 'package:fast_collocation_dictionary/widget/my_keyboard.dart';
import 'package:fast_collocation_dictionary/widget/typed_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final typedTextList = ref.watch(keyboardProvider);
    // final suggestedLetter = ref.watch(suggestedLettersProvider);


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home Page'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
          // Text(box.read('learntWords') ?? 'No word added yet')
        ],
    
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Center(
          child: Column(
            children: <Widget>[
              // const Wrap(
              //   spacing: 20,
              //   runSpacing: 10,
              //   children: [
              //   ],
              // ),
              gapH16,
              const FilteredWords(),
              const Spacer(),
              // if (typedTextList.toString().isNotEmpty)
              //   SizedBox(
              //     height: 55,
              //     child: ListView.separated(
              //       separatorBuilder: (context, index) => gapW16,
              //       scrollDirection: Axis.horizontal,
              //       // reverse: true,
              //       itemCount: suggestedLetter.length,
              //       itemBuilder: (context, index) {
              //         final result = suggestedLetter[index];
              //         return Center(
              //           child: Center(
              //             child: ElevatedButton(
              //                 onPressed: () {
              //                   if (typedTextList.length > 1) {
              //                     ref.read(keyboardProvider.notifier).state =
              //                         typedTextList.slice(0, -2) + result;
              //                   }
              //                 },
              //                 child: Text(result)),
              //           ),
              //         );
              //       },
              //     ),
              //   ),
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
