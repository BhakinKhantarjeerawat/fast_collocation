import 'package:fast_collocation_dictionary/fake_product_repo.dart';
import 'package:fast_collocation_dictionary/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AuthRobot {
  AuthRobot(this.tester);
  final WidgetTester tester;

  Future<void> pumpTestScreen(String testMock) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: TestScreen(
              testString: '7',
              testMock: testMock,
              fakeProductRepo: MockFakeProductRepo()),
        ),
      ),
    );
  }
}

class MockFakeProductRepo extends Mock implements FakeProductRepo {}

void main() {
  group('TestScreen', () {
    testWidgets('MockFakeProductRepo', (tester) async {
      final mock = MockFakeProductRepo();
      when(() => mock.getProducts('1')).thenReturn('Factory');
      expect(mock.getProducts('1'), 'Factory');
      final r = AuthRobot(tester);
      await tester.runAsync(() async {
        await r.pumpTestScreen('testMock');
        expect(find.text('Store'), findsOneWidget);
        // expect(find.text('no test mock data'), findsOneWidget);
        expect(find.text('testMock'), findsOneWidget);
      });
    });
    testWidgets('MainScreen', (tester) async {
      final r = AuthRobot(tester);
      await tester.runAsync(() async {
        await r.pumpTestScreen('testMock');
        expect(find.text('7'), findsOneWidget);
        expect(find.text('0'), findsOneWidget);
        expect(find.text('increase'), findsOneWidget);
        expect(find.text('show Alert dialog'), findsOneWidget);
        expect(find.text('show BottomSheet'), findsOneWidget);
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });
    });

    testWidgets('AlertDialog', (tester) async {
      final r = AuthRobot(tester);
      await tester.runAsync(() async {
        await r.pumpTestScreen('testMock');
        await tester.tap(find.text('show Alert dialog'));
        await tester.pump();
        expect(find.text('Alert Dialog Box'), findsOneWidget);
        expect(find.text('You have raised a Alert Dialog Box'), findsOneWidget);
        expect(find.byType(TextFormField), findsOneWidget);
        expect(find.byKey(const Key('okay')), findsOneWidget);
        await tester.tap(find.byKey(const Key('okay')));
        await tester.pump();
        expect(find.text('Alert Dialog Box'), findsNothing);
        expect(find.byType(TextFormField), findsNothing);
        expect(find.text('You have raised a Alert Dialog Box'), findsNothing);
        expect(find.byKey(const Key('okay')), findsNothing);
      });
    });

    testWidgets('BottomSheet', (tester) async {
      final r = AuthRobot(tester);
      await tester.runAsync(() async {
        await r.pumpTestScreen('testMock');
        await tester.tap(find.text('show BottomSheet'));
        await tester.pump();
        expect(find.text('Share'), findsOneWidget);
        expect(find.text('Copy Link'), findsOneWidget);
        expect(find.text('Edit'), findsOneWidget);
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        expect(find.byKey(const Key('Share')), findsOneWidget);
        expect(find.byKey(const Key('firstIcon')), findsOneWidget);
      });
    });
  });
}
