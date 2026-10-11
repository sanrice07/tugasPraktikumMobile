import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HalamanKartu(),
    );
  }
}

class HalamanKartu extends StatelessWidget {
  const HalamanKartu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      // Optimasi
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // kartu bagian ke satu
                const CardKosong(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.blueGrey,
                        child: Icon(Icons.person, size: 50, color: Colors.white),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Ikhsan Salman',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Flutter Pemula',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      Divider(height: 32),
                      BarisInfo(icon: Icons.email, teks: 'Ikhsan@email.com'),
                      BarisInfo(icon: Icons.phone, teks: '08123445677'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Kartu bagian ke dua
                const CardKosong(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      JudulCard('Media Sosial'),
                      BarisInfo(
                          icon: Icons.camera_alt, teks: '@ikhsan (Instagram)'),
                      BarisInfo(
                          icon: Icons.music_note, teks: '@sanzz (TikTok)'),
                      BarisInfo(
                          icon: Icons.facebook, teks: 'facebook.com/salaman'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Kartu bagian ke 3 
                const CardKosong(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      JudulCard('Cita-Cita'),
                      BarisInfo(icon: Icons.money, teks: 'Uang banyak'),
                      BarisInfo(
                          icon: Icons.nature_people, teks: 'Banyak pahala'),
                      BarisInfo(
                          icon: Icons.icecream,
                          teks: 'Punya ide dan bisa berpikir'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// border semua kartu
class CardKosong extends StatelessWidget {
  final Widget child;
  const CardKosong({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: child,
        ),
      ),
    );
  }
}

class JudulCard extends StatelessWidget {
  final String teks;
  const JudulCard(this.teks, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        teks,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class BarisInfo extends StatelessWidget {
  final IconData icon;
  final String teks;

  const BarisInfo({super.key, required this.icon, required this.teks});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.blueGrey),
          const SizedBox(width: 12),
          Text(teks, style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}