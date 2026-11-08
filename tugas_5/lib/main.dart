import 'package:flutter/material.dart';
import 'package:tugas_5/DetailPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Produk',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {
        'nama': 'MacBook',
        'harga': '1100',
        'deskripsi': 'Laptop tipis dengan baterai awet, cocok untuk desain, coding, dan pekerjaan kantor sehari-hari.',
        'image': 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=600',
      },
      {
        'nama': 'Mesin Cuci',
        'harga': '1400',
        'deskripsi': 'Mesin cuci otomatis yang menghemat waktu dan tenaga, mampu membersihkan pakaian dengan hasil bersih dan wangi.',
        'image': 'https://images.unsplash.com/photo-1626806787461-102c1bfaaea1?w=600',
      },
      {
        'nama': 'Kipas Angin',
        'harga': '1200',
        'deskripsi': 'Kipas angin berdaya rendah dengan hembusan kuat untuk menyejukkan ruangan tanpa boros listrik.',
        'image': 'https://images.unsplash.com/photo-1618941716939-553df3c6c278?w=600',
      },
      {
        'nama': 'Monitor',
        'harga': '550',
        'deskripsi': 'Monitor Full HD dengan warna tajam, nyaman untuk bekerja, belajar, maupun bermain game.',
        'image': 'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=600',
      },
      {
        'nama': 'Headphone',
        'harga': '350',
        'deskripsi': 'Headphone nirkabel dengan suara jernih dan bass mantap, nyaman dipakai berjam-jam.',
        'image': 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600',
      },
      {
        'nama': 'Smartwatch',
        'harga': '300',
        'deskripsi': 'Jam pintar untuk memantau detak jantung, langkah kaki, dan notifikasi ponsel langsung dari pergelangan tangan.',
        'image': 'https://images.unsplash.com/photo-1546868871-7041f2a55e12?w=600',
      },
      {
        'nama': 'Keyboard Mekanikal',
        'harga': '250',
        'deskripsi': 'Keyboard mekanikal dengan tombol responsif dan lampu RGB, nyaman untuk mengetik maupun gaming.',
        'image': 'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=600',
      },
      {
        'nama': 'Tablet',
        'harga': '650',
        'deskripsi': 'Tablet layar lebar yang praktis untuk membaca, mencatat, menonton, dan belajar online.',
        'image': 'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=600',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PRODUK - PRODUK ELEKTRONIK',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 15, 72, 169),
        centerTitle: true,
        leading: const Icon(Icons.shopping_cart, color: Colors.white, size: 30),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: SizedBox(
              width: 56,
              height: 56,
              child: Image.network(
                product['image'],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image_not_supported),
              ),
            ),
            title: Text(product['nama']),
            subtitle: Text('Harga : ${product['harga']}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    itemTitle: product['nama'],
                    itemPrice: product['harga'],
                    itemImage: product['image'],
                    itemDescription: product['deskripsi'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}