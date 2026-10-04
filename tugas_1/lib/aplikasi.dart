import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Biodata',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int quoteIndex = 0;

  // Baris pertama = nama, baris berikutnya = data (data di isi sesuka hati)
  final List<List<String>> quotes = [
    [
      'Ikhsan',
      'Hobi : Desain',
      'Cita-cita : UI/UX Designer',
    ],
    [
      'Rommy',
      'Hobi : Olahraga & Musik',
      'Cita-cita : Entrepreneur',
    ],
    [
      'Arbi',
      'Hobi : Membaca & Coding',
      'Cita-cita : Software Enginer',
    ],
  ];

  void changeQuote() {
    setState(() {
      quoteIndex = (quoteIndex + 1) % quotes.length;
    });
  }

  // Animasi slide beda untuk tiap biodata
  Widget animasi(Widget child, Animation<double> anim) {
    if (quoteIndex == 0) {
      // Ikhsan: geser dari kanan
      return SlideTransition(
        position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
            .animate(anim),
        child: child,
      );
    } else if (quoteIndex == 1) {
      // Rommy: naik dari bawah
      return SlideTransition(
        position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
            .animate(anim),
        child: FadeTransition(opacity: anim, child: child),
      );
    } else {
      // Arbi: zoom
      return ScaleTransition(scale: anim, child: child);
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = quotes[quoteIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFE0F7FA),

      appBar: AppBar(
        title: const Text(
          'Biodata',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.person_rounded,
                size: 60,
                color: Colors.cyan,
              ),

              const SizedBox(height: 20),

              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: animasi,
                child: Container(
                  key: ValueKey(quoteIndex),
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withValues(alpha: 0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data[0],
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                        ),
                      ),
                      const SizedBox(height: 15),
                      for (final baris in data.skip(1))
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            baris,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF00838F),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: changeQuote,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text('Biodata Berikutnya'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}