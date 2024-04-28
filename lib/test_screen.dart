import 'package:fast_collocation_dictionary/fake_product_repo.dart';
import 'package:fast_collocation_dictionary/first_provider.dart';
import 'package:fast_collocation_dictionary/second_provider.dart';
import 'package:fast_collocation_dictionary/test_state_provider.dart';
import 'package:fast_collocation_dictionary/third_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final testList = [1, 2, 3];

class TestScreen extends ConsumerStatefulWidget {
  const TestScreen({super.key, required this.testString, this.testMock,  this.fakeProductRepo});
  final String testString;
  final String? testMock;
  final FakeProductRepo? fakeProductRepo;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TestScreenState();
}

class _TestScreenState extends ConsumerState<TestScreen> {
  @override
  void initState() {
    print('initState called');
    super.initState();
  }

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final first = ref.watch(firstProvider);
    final second = ref.watch(secondProvider);
    final third = ref.watch(thirdProvider);
    final stateProvider = ref.watch(testStateProvider);
    print('///Build method called');

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.testString),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(FakeProductRepo().getProducts('1')),
              Text(widget.testMock ?? 'no test mock data'),
              Text(FakeProductRepo().getProducts('1')),
              Text(stateProvider.toString()),
              ElevatedButton(
                  onPressed: () {
                    ref.read(testStateProvider.notifier).state += 1;
                  },
                  child: const Text('increase')),
              ElevatedButton(
                  onPressed: () => showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text("Alert Dialog Box"),
                          content:
                              const Text("You have raised a Alert Dialog Box"),
                          actions: <Widget>[
                            TextFormField(),
                            TextButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: Container(
                                color: Colors.green,
                                padding: const EdgeInsets.all(14),
                                child: const Text(key: Key('okay'), "okay"),
                              ),
                            ),
                          ],
                        ),
                      ),
                  child: const Text('show Alert dialog')),
              ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Wrap(
                          children: [
                            TextFormField(),
                            const ListTile(
                              key: Key('Share'),
                              leading: Icon(key: Key('firstIcon'), Icons.share),
                              title: Text('Share'),
                            ),
                            const ListTile(
                              leading: Icon(Icons.copy),
                              title: Text('Copy Link'),
                            ),
                            const ListTile(
                              leading: Icon(Icons.edit),
                              title: Text('Edit'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text('show BottomSheet')),

              // SizedBox(
              //   height: 300,
              //   child: ListView.builder(
              //     itemCount: testList.length,
              //     itemBuilder: (context, index) {
              //       final result = testList[index];
              //       return Text(key: Key(result.toString()), result.toString());
              //     },
              //   ),
              // ),
              first.when(
                data: (data) => Text(data.toString()),
                error: (error, stackTrace) => Text(error.toString()),
                loading: () => const Center(child: CircularProgressIndicator()),
              ),
              // second.when(
              //   data: (data) => Text(data.toString()),
              //   error: (error, stackTrace) => Text(error.toString()),
              //   loading: () => const Center(child: CircularProgressIndicator()),
              // ),
              // third.when(
              //   data: (data) => Text(data.toString()),
              //   error: (error, stackTrace) => const SizedBox.shrink(),
              //   loading: () => const Center(child: CircularProgressIndicator()),
              // )
            ],
          ),
        ));
  }
}
