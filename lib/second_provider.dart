import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'second_provider.g.dart';

@riverpod
Future<int> second(SecondRef ref) async {
  await Future.delayed(const Duration(seconds: 5));
  return 2;
}
