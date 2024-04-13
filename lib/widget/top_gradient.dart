// import 'package:fast_collocation_dictionary/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class TopGradient extends StatelessWidget {
  const TopGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.blueAccent, Colors.white],
      )),
      child: const Column(
        children: [
          // gapH20,
          // Align(alignment: Alignment.topCenter, child: _TopPart()),
        ],
      ),
    );
  }
}
