import 'package:flutter/material.dart';

enum Gender { lakiLaki, perempuan }

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  static const String _ketAwal = "Masukkan Data Anda!!!";

  final _bbController = TextEditingController();
  final _tbController = TextEditingController();

  Gender _gender = Gender.lakiLaki;
  double? _hasilBMI;
  String _keterangan = _ketAwal;
  Color _warnaKeterangan = Colors.blueGrey;

  // Batas kategori BMI per jenis kelamin: [batas kurus, batas ideal, batas gemuk]
  static const Map<Gender, List<double>> _batas = {
    Gender.lakiLaki: [20.1, 25.1, 27.1],
    Gender.perempuan: [18.7, 23.9, 28.7],
  };

  String get _labelGender =>
      _gender == Gender.lakiLaki ? 'Laki-laki' : 'Perempuan';

  void _hitungBMI() {
    final double bb =
        double.tryParse(_bbController.text.replaceAll(',', '.')) ?? 0;
    final double tbCm =
        double.tryParse(_tbController.text.replaceAll(',', '.')) ?? 0;

    setState(() {
      if (bb > 0 && tbCm > 0) {
        final double tbM = tbCm / 100;
        final double hasil = bb / (tbM * tbM);
        final batas = _batas[_gender]!;

        _hasilBMI = hasil;
        if (hasil < batas[0]) {
          _keterangan = "Kurusss";
          _warnaKeterangan = Colors.orange.shade800;
        } else if (hasil < batas[1]) {
          _keterangan = "Mantap Euy Ideal";
          _warnaKeterangan = Colors.green.shade700;
        } else if (hasil < batas[2]) {
          _keterangan = "Kelebihan Berat Badan";
          _warnaKeterangan = Colors.orange.shade800;
        } else {
          _keterangan = "Obesitas";
          _warnaKeterangan = Colors.red.shade700;
        }
      } else {
        _hasilBMI = null;
        _keterangan = "Data Tidak Valid!!!";
        _warnaKeterangan = Colors.red.shade700;
      }
    });
  }

  void _resetBMI() {
    _bbController.clear();
    _tbController.clear();
    FocusScope.of(context).unfocus();
    setState(() {
      _gender = Gender.lakiLaki;
      _hasilBMI = null;
      _keterangan = _ketAwal;
      _warnaKeterangan = Colors.blueGrey;
    });
  }

  @override
  void dispose() {
    _bbController.dispose();
    _tbController.dispose();
    super.dispose();
  }

  InputDecoration _dekorasi(String label, IconData ikon, String satuan) {
    return InputDecoration(
      prefixIcon: Icon(ikon, color: const Color(0xFF0D47A1)),
      labelText: label,
      suffixText: satuan,
      filled: true,
      fillColor: Colors.blue.shade50,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF1565C0), width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Kalkulator BMI',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 3),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        leading: const Icon(Icons.accessibility_new),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0D47A1),
              Color(0xFF1976D2),
              Color(0xFF90CAF9),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 480),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _kartuInput(),
                    const SizedBox(height: 20),
                    _kartuHasil(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _kartuInput() {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Jenis Kelamin',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF0D47A1),
              ),
            ),
            const SizedBox(height: 8),
            SegmentedButton<Gender>(
              segments: const [
                ButtonSegment(
                  value: Gender.lakiLaki,
                  label: Text('Laki-laki'),
                  icon: Icon(Icons.male),
                ),
                ButtonSegment(
                  value: Gender.perempuan,
                  label: Text('Perempuan'),
                  icon: Icon(Icons.female),
                ),
              ],
              selected: {_gender},
              onSelectionChanged: (pilihan) {
                setState(() => _gender = pilihan.first);
                // Kalau hasil sudah ada, hitung ulang sesuai jenis kelamin baru
                if (_hasilBMI != null) _hitungBMI();
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _bbController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: _dekorasi('Berat Badan', Icons.monitor_weight, 'kg'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _tbController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: _dekorasi('Tinggi Badan', Icons.height, 'cm'),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ElevatedButton.icon(
                    onPressed: _hitungBMI,
                    icon: const Icon(Icons.calculate),
                    label: const Text('Hitung BMI',
                        style: TextStyle(fontSize: 16)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0D47A1),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _resetBMI,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Reset', style: TextStyle(fontSize: 16)),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF0D47A1),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: const BorderSide(color: Color(0xFF0D47A1)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _kartuHasil() {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Hasil untuk $_labelGender',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF0D47A1),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _hasilBMI?.toStringAsFixed(1) ?? 'Nilai Kosong',
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D47A1),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _keterangan,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: _warnaKeterangan,
              ),
            ),
          ],
        ),
      ),
    );
  }
}