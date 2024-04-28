import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'first_provider.g.dart';

@riverpod
Future<int> first(FirstRef ref) async {
  await Future.delayed(const Duration(seconds: 5));
  return 2;
}

// @riverpod
// Future<First> first(FirstRef ref) async {
//   // await Future.delayed(const Duration(seconds: 2));
//   final first = First();
//   return first;
// }

// @riverpod
// Future<First> getProduct(FirstRef ref) async {
//   // await Future.delayed(const Duration(seconds: 2));
//   final first = ref.read(firstProvider);
//   return first.getProduct();
// }

// class First {
//   Future<int> getProduct() async {
//     await Future.delayed(const Duration(seconds: 2));
//   return 1;
//   }
// }

