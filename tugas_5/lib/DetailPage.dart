import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String itemTitle;
  final String itemPrice;
  final String itemImage;
  final String itemDescription;

  const DetailPage({
    super.key,
    required this.itemTitle,
    required this.itemPrice,
    required this.itemImage,
    required this.itemDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemTitle),
        backgroundColor:  const Color.fromARGB(255, 15, 72, 169),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 250,
                child: Image.network(
                  itemImage,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.image_not_supported, size: 100),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              itemTitle,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              'Harga : $itemPrice',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color:  const Color.fromARGB(255, 15, 72, 169),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Deskripsi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              itemDescription,
              style: const TextStyle(fontSize: 15, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}