import 'package:fast_collocation_dictionary/constants/app_sizes.dart';
import 'package:fast_collocation_dictionary/keyboard_provider.dart';
import 'package:fast_collocation_dictionary/widget/my_key_board_button2.dart';
import 'package:fast_collocation_dictionary/widget/my_keyboard_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyKeyBoard2 extends ConsumerStatefulWidget {
  const MyKeyBoard2({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyKeyBoard2State();
}

class _MyKeyBoard2State extends ConsumerState<MyKeyBoard2> {
  @override
  Widget build(BuildContext context) {
    final currentTypedText = ref.watch(keyboardProvider);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyButtonKeyboard2(
                    text: '1',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '${currentTypedText}1'),
                MyButtonKeyboard2(
                    text: '2',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '${currentTypedText}2'),
                MyButtonKeyboard2(
                    text: '3',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '${currentTypedText}3'),
                MyButtonKeyboard2(
                    text: '4',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '${currentTypedText}4'),
                MyButtonKeyboard2(
                    text: '5',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '${currentTypedText}5'),
                MyButtonKeyboard2(
                    text: '6',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '${currentTypedText}6'),
                MyButtonKeyboard2(
                    text: '7',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '${currentTypedText}7'),
                MyButtonKeyboard2(
                    text: '8',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '${currentTypedText}8'),
                MyButtonKeyboard2(
                    text: '9',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '${currentTypedText}9'),
                MyButtonKeyboard2(
                    text: '0',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '${currentTypedText}0'),
              ],
            ),
            gapH8,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ElevatedButton(child: const Text('พ'), onPressed: () {}),
                MyButtonKeyboard(
                    text: 'ฎ',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextฎ'),
                MyButtonKeyboard(
                    text: 'ฑ',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextฑ'),
                MyButtonKeyboard(
                    text: 'ธ',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextธ'),
                MyButtonKeyboard(
                    text: 'ณ',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextณ'),
                MyButtonKeyboard(
                    text: 'ญ',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextญ'),
                MyButtonKeyboard(
                    text: 'ฐ',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextฐ'),
                // MyButtonKeyboard(
                //     text: 'ล',
                //     onPressed: () => ref.read(keyboardProvider.notifier).state =
                //         '$currentTypedTextล'),
              ],
            ),
            gapH8,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyButtonKeyboard(
                    text: 'ฤ',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextฤ'),
                MyButtonKeyboard(
                    text: 'ฆ',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextฆ'),
                MyButtonKeyboard(
                    text: 'ฏ',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextฏ'),
                MyButtonKeyboard(
                    text: 'ฌ',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextฌ'),
                MyButtonKeyboard(
                    text: 'ษ',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextษ'),
                MyButtonKeyboard(
                    text: 'ศ',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextศ'),
                MyButtonKeyboard(
                    text: 'ซ',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextซ'),
              ],
            ),
            gapH8,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyButtonKeyboard(text: '/', onPressed: () {}),
                MyButtonKeyboard(
                    text: 'ฉ',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextฉ'),
                MyButtonKeyboard(
                    text: 'ฮ',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextฮ'),
                MyButtonKeyboard(
                    text: 'ฒ',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextฒ'),
                MyButtonKeyboard(
                    text: 'ฬ',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextฬ'),
                MyButtonKeyboard(
                    text: 'ฦ',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextฦ'),
                // MyButtonKeyboard(
                //     text: 'ฝ',
                //     onPressed: () => ref.read(keyboardProvider.notifier).state =
                //         '$currentTypedTextฝ'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
