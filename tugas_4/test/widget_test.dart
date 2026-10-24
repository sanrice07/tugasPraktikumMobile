  import 'package:flutter_test/flutter_test.dart';
  import 'package:tugas_4/main.dart';

  void main() {
    testWidgets('Aplikasi tampil', (WidgetTester tester) async {
      await tester.pumpWidget(const JapanNewsApp());
      expect(find.text('Berita Jepang'), findsOneWidget);
    });
  }