import 'package:flutter_test/flutter_test.dart';
import 'package:app/main.dart';

void main() {
  testWidgets("Tank card click", (tester) async {
    await tester.pumpWidget(const MyApp());

    // Tap on the first tank card
    await tester.tap(find.text("Panzerkampfwagen I"));
    await tester.pumpAndSettle();

    // Expect price to update or success message
    expect(find.textContaining("Price:"), findsOneWidget);
  });
}
