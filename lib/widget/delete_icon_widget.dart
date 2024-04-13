import 'package:fast_collocation_dictionary/keyboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeleteIconWidget extends StatelessWidget {
  const DeleteIconWidget({
    super.key,
    required this.ref,
  });

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 145, 246, 152)),
          onPressed: () {
            ref.read(keyboardProvider.notifier).state = '';
          },
          child: const Icon(Icons.remove)),
    );
  }
}
