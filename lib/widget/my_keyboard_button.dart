import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyButtonKeyboard extends ConsumerWidget {
  const MyButtonKeyboard(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        width: 50,
        child: ElevatedButton(
            onPressed: onPressed,
            child: Center(
              child: Text(
                text,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            )));
  }
}
