import 'package:flutter_test/flutter_test.dart';
import 'package:try2/main.dart';

void main() {
  testWidgets('Calculator app builds and shows initial 0', (WidgetTester tester) async {
    await tester.pumpWidget(const CalculatorApp()); // now matches main.dart

    // Check that CalculatorApp is present
    expect(find.byType(CalculatorApp), findsOneWidget);

    // Check that the display starts with '0'
    expect(find.text('0'), findsOneWidget);
  });
}
