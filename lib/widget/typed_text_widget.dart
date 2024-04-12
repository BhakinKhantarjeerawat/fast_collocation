import 'package:flutter/material.dart';

class TypedTextWidget extends StatelessWidget {
  const TypedTextWidget({
    super.key,
    required this.value,
  });

  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: MediaQuery.of(context).size.width - (32 + 90),
      child: Text(
        value,
        style: const TextStyle(fontSize: 25),
      ),
    );
  }
}
