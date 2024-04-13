import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
              color: const Color.fromARGB(255, 215, 250, 217),
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