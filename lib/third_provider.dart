import 'package:fast_collocation_dictionary/first_provider.dart';
import 'package:fast_collocation_dictionary/second_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'third_provider.g.dart';

@riverpod
Future<int
> third(ThirdRef ref) async {
  await Future.delayed(const Duration(seconds: 2));
  final first = ref.watch(firstProvider).value;
  final second = ref.watch(secondProvider).value;

  return first! + second!;

  // if (first != null && second != null) {
  //   return first + second;
  // }
  //  else {
  //   return 555;
  // }
  //  else {
  //   // throw('HAHAHA');
  //   throw Exception('HAHAHA');
  //   // return Exception('hahaha');
  // }
}
