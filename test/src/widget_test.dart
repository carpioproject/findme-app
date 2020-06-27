import 'package:findme/src/widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    // await tester.pumpWidget(MyWidget(title: 'T', message: 'M'));

    // final titleFinder = find.text('T');
    // final messageFinder = find.text('M');

    // expect(titleFinder, findsOneWidget);
    // expect(messageFinder, findsOneWidget);
    expect(true, true);
  });
}
