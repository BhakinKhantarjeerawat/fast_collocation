import 'package:fast_collocation_dictionary/constants/mapped_clc.dart';
import 'package:fast_collocation_dictionary/widget/my_text.dart';
import 'package:flutter/material.dart';

Future<dynamic> myBottomSheet(context, String clc, String mappedWord) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      final addedUnderscoreWord = '${mappedWord}_$clc';
      final mappedResult = mappedClc[addedUnderscoreWord];
      if (mappedResult == null) {
        return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            child: const MyText('***can not mapped the data', fontSize: 18));
      } else {
        return Container(
            padding: const EdgeInsets.all(24),
            width: double.infinity,
            child: MyText(mappedResult, fontSize: 18));
      }
    },
  );
}
