import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExecercisePage extends ConsumerStatefulWidget {
  const ExecercisePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExecercisePageState();
}

class _ExecercisePageState extends ConsumerState<ExecercisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Exercise Page')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Column(
            children: [
              Tooltip(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 179, 205, 251),
                    borderRadius: BorderRadius.circular(20)),
                message: 'ทาว เอ่อ|หอคอย',
                textStyle: const TextStyle(fontSize: 25),
                // onTriggered: () => print('WN'),
                child: ElevatedButton(
                    onPressed: () {
                      print('wn');
                      // ref.read(ttsProvider).speak('tower');
                    },
                    child: const Text('Tower')),
              ),
            ],
          )),
        ));
  }
}
