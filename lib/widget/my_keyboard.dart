import 'package:fast_collocation_dictionary/constants/app_sizes.dart';
import 'package:fast_collocation_dictionary/providers/keyboard_provider.dart';
import 'package:fast_collocation_dictionary/widget/my_keyboard_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyKeyBoard extends ConsumerStatefulWidget {
  const MyKeyBoard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyKeyBoardState();
}

class _MyKeyBoardState extends ConsumerState<MyKeyBoard> {
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
                MyButtonKeyboard(
                    text: 'ภ',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextภ'),
                MyButtonKeyboard(
                    text: 'ถ',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextถ'),
                MyButtonKeyboard(
                    text: 'ค',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextค'),
                MyButtonKeyboard(
                    text: 'ต',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextต'),
                MyButtonKeyboard(
                    text: 'จ',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextจ'),
                MyButtonKeyboard(
                    text: 'ข',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextข'),
                MyButtonKeyboard(
                    text: 'ช',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextช'),
              ],
            ),
            gapH8,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ElevatedButton(child: const Text('พ'), onPressed: () {}),
                // MyButtonKeyboard(
                //     text: 'ฉ',
                //     onPressed: () => ref.read(keyboardProvider.notifier).state =
                //         '$currentTypedTextฉ'),
                MyButtonKeyboard(
                    text: 'พ',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextพ'),
                MyButtonKeyboard(
                    text: 'ร',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextร'),
                MyButtonKeyboard(
                    text: 'น',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextน'),
                MyButtonKeyboard(
                    text: 'ย',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextย'),
                MyButtonKeyboard(
                    text: 'บ',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextบ'),
                MyButtonKeyboard(
                    text: 'ล',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextล'),
              ],
            ),
            gapH8,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyButtonKeyboard(
                    text: 'ฟ',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextฟ'),
                MyButtonKeyboard(
                    text: 'ห',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextห'),
                MyButtonKeyboard(
                    text: 'ก',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextก'),
                MyButtonKeyboard(
                    text: 'ด',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextด'),
                MyButtonKeyboard(
                    text: 'ส',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextส'),
                MyButtonKeyboard(
                    text: 'ว',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextว'),
                MyButtonKeyboard(
                    text: 'ง',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextง'),
              ],
            ),
            gapH8,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyButtonKeyboard(text: '/', onPressed: () {}),
                MyButtonKeyboard(
                    text: 'ผ',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextผ'),
                MyButtonKeyboard(
                    text: 'ป',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextป'),
                MyButtonKeyboard(
                    text: 'อ',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextอ'),
                MyButtonKeyboard(
                    text: 'ท',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextท'),
                MyButtonKeyboard(
                    text: 'ม',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextม'),
                MyButtonKeyboard(
                    text: 'ฝ',
                    onPressed: () => ref.read(keyboardProvider.notifier).state =
                        '$currentTypedTextฝ'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
