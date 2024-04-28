import 'package:fast_collocation_dictionary/fake_product_repo.dart';
import 'package:fast_collocation_dictionary/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFakeProductRepo extends Mock implements FakeProductRepo {}

class AuthRobot {
  AuthRobot(this.tester);
  final WidgetTester tester;

  Future<void> pumpTestScreen(FakeProductRepo fakeProductRepo) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: TestScreen(fakeProductRepo: fakeProductRepo),
        ),
      ),
    );
  }
}


void main() {
  group('TestScreen', () {
    testWidgets('MockFakeProductRepo', (tester) async {
      final mock = MockFakeProductRepo();
      when(() => mock.getProducts('1')).thenReturn('Factory');
      expect(mock.getProducts('1'), 'Factory');
      //////////////////////////////////////////////////
      final r = AuthRobot(tester);
      await tester.runAsync(() async {
        await r.pumpTestScreen(mock);
        // expect(find.text('Store'), findsOneWidget);
        // expect(find.text('Factory'), findsOneWidget);
      });
    });
  });
}
