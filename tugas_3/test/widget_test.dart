import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tugas_3/main.dart';

void main() {
  testWidgets('Hitung BMI laki-laki dengan data valid',
      (WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 1400));
    await tester.pumpWidget(const KalkulatorBMI());

    expect(find.text('Masukkan Data Anda!!!'), findsOneWidget);

    await tester.enterText(find.byType(TextField).at(0), '70');
    await tester.enterText(find.byType(TextField).at(1), '175');
    await tester.tap(find.text('Hitung BMI'));
    await tester.pump();

    expect(find.text('22.9'), findsOneWidget);
    expect(find.text('Mantap Euy Ideal'), findsOneWidget);
  });

  testWidgets('Jenis kelamin mempengaruhi kategori',
      (WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 1400));
    await tester.pumpWidget(const KalkulatorBMI());

    // Ideal untuk laki-laki, kelebihan berat badan untuk perempuan
    await tester.enterText(find.byType(TextField).at(0), '74');
    await tester.enterText(find.byType(TextField).at(1), '175');
    await tester.tap(find.text('Hitung BMI'));
    await tester.pump();
    expect(find.text('Mantap Euy Ideal'), findsOneWidget);

    await tester.tap(find.text('Perempuan'));
    await tester.pump();
    expect(find.text('Kelebihan Berat Badan'), findsOneWidget);
    expect(find.text('Hasil untuk Perempuan'), findsOneWidget);
  });

  testWidgets('Tombol Reset mengosongkan input dan hasil',
      (WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 1400));
    await tester.pumpWidget(const KalkulatorBMI());

    await tester.enterText(find.byType(TextField).at(0), '70');
    await tester.enterText(find.byType(TextField).at(1), '175');
    await tester.tap(find.text('Hitung BMI'));
    await tester.pump();
    expect(find.text('22.9'), findsOneWidget);

    await tester.tap(find.text('Reset'));
    await tester.pump();

    expect(find.text('22.9'), findsNothing);
    expect(find.text('Nilai Kosong'), findsOneWidget);
    expect(find.text('Masukkan Data Anda!!!'), findsOneWidget);
    expect(find.text('70'), findsNothing);
    expect(find.text('175'), findsNothing);
  });

  testWidgets('Data kosong menampilkan pesan tidak valid',
      (WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 1400));
    await tester.pumpWidget(const KalkulatorBMI());

    await tester.tap(find.text('Hitung BMI'));
    await tester.pump();

    expect(find.text('Data Tidak Valid!!!'), findsOneWidget);
    expect(find.text('Nilai Kosong'), findsOneWidget);
  });
}