import 'package:fast_collocation_dictionary/fake_product_repo.dart';
import 'package:fast_collocation_dictionary/first_provider.dart';
import 'package:fast_collocation_dictionary/second_provider.dart';
import 'package:fast_collocation_dictionary/test_state_provider.dart';
import 'package:fast_collocation_dictionary/third_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final testList = [1, 2, 3];

class TestScreen extends ConsumerStatefulWidget {
  const TestScreen({super.key,  this.fakeProductRepo});

  final FakeProductRepo? fakeProductRepo;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TestScreenState();
}

class _TestScreenState extends ConsumerState<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('test screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.fakeProductRepo!.getProducts('1')),
            ],
          ),
        ));
  }
}
