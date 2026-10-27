import 'package:flutter/material.dart';

const String kNama = 'Ikhsan Salman Alfaris';
const String kNpm = '5520124009';
const String kJurusan = 'Informatika';
const String kKelas = 'IF A 24';

// Warna ShopSmart 
const Color kOrange = Color(0xFFEE4D2D);
const Color kOrangeSoft = Color(0xFFFFE0D9);

const double kMaxPrice = 5000000;

void main() => runApp(const ShopSmartApp());

class ShopSmartApp extends StatelessWidget {
  const ShopSmartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShopSmart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: kOrange,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      home: const HomeScreen(),
    );
  }
}

class Product {
  final int id;
  final String name;
  final int price;
  final String category;
  final double rating;
  final int sold;
  final IconData icon;
  final Color color;
  final String description;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.rating,
    required this.sold,
    required this.icon,
    required this.color,
    required this.description,
  });
}

const List<String> kCategories = [
  'Semua',
  'Elektronik',
  'Fashion',
  'Rumah',
  'Olahraga',
  'Kecantikan',
];

const List<Product> kProducts = [
  Product(
    id: 1,
    name: 'Smartphone Android 8GB/256GB',
    price: 3499000,
    category: 'Elektronik',
    rating: 4.8,
    sold: 1200,
    icon: Icons.smartphone,
    color: Colors.indigo,
    description:
        'Smartphone dengan layar AMOLED 6,5", RAM 8GB, penyimpanan 256GB, dan baterai 5000 mAh dengan fast charging.',
  ),
  Product(
    id: 2,
    name: 'Earbuds Bluetooth TWS',
    price: 249000,
    category: 'Elektronik',
    rating: 4.6,
    sold: 5400,
    icon: Icons.headphones,
    color: Colors.teal,
    description:
        'Earbuds nirkabel dengan noise cancelling, daya tahan baterai hingga 24 jam bersama case pengisi daya.',
  ),
  Product(
    id: 3,
    name: 'Smartwatch Fit Pro',
    price: 899000,
    category: 'Elektronik',
    rating: 4.7,
    sold: 860,
    icon: Icons.watch,
    color: Colors.deepPurple,
    description:
        'Smartwatch dengan pelacak detak jantung, SpO2, GPS, dan lebih dari 100 mode olahraga.',
  ),
  Product(
    id: 4,
    name: 'Kemeja Flanel Pria',
    price: 129000,
    category: 'Fashion',
    rating: 4.5,
    sold: 3100,
    icon: Icons.checkroom,
    color: Colors.red,
    description:
        'Kemeja flanel berbahan katun lembut, nyaman dipakai harian maupun santai. Tersedia ukuran M sampai XXL.',
  ),
  Product(
    id: 5,
    name: 'Sneakers Casual Unisex',
    price: 349000,
    category: 'Fashion',
    rating: 4.6,
    sold: 2250,
    icon: Icons.shopping_bag,
    color: Colors.brown,
    description:
        'Sepatu sneakers ringan dengan sol anti-slip, cocok untuk kuliah, kerja, dan jalan-jalan.',
  ),
  Product(
    id: 6,
    name: 'Kursi Gaming Ergonomis',
    price: 1750000,
    category: 'Rumah',
    rating: 4.7,
    sold: 430,
    icon: Icons.chair,
    color: Colors.blueGrey,
    description:
        'Kursi dengan sandaran punggung yang bisa direbahkan, bantal leher, dan sandaran tangan 3D.',
  ),
  Product(
    id: 7,
    name: 'Rice Cooker Digital 1L',
    price: 425000,
    category: 'Rumah',
    rating: 4.4,
    sold: 1780,
    icon: Icons.kitchen,
    color: Colors.orange,
    description:
        'Rice cooker digital dengan fungsi memasak, mengukus, dan menghangatkan. Panci anti lengket.',
  ),
  Product(
    id: 8,
    name: 'Dumbbell Set 10kg',
    price: 275000,
    category: 'Olahraga',
    rating: 4.5,
    sold: 960,
    icon: Icons.fitness_center,
    color: Colors.green,
    description:
        'Satu set dumbbell adjustable total 10kg dengan lapisan karet agar aman dan tidak licin.',
  ),
  Product(
    id: 9,
    name: 'Bola Sepak Size 5',
    price: 159000,
    category: 'Olahraga',
    rating: 4.6,
    sold: 2040,
    icon: Icons.sports_soccer,
    color: Colors.lightGreen,
    description:
        'Bola sepak ukuran standar 5 berbahan PU dengan jahitan kuat dan pantulan stabil.',
  ),
  Product(
    id: 10,
    name: 'Serum Wajah Vitamin C',
    price: 89000,
    category: 'Kecantikan',
    rating: 4.8,
    sold: 7200,
    icon: Icons.spa,
    color: Colors.pink,
    description:
        'Serum vitamin C 20ml untuk membantu mencerahkan wajah dan menyamarkan noda hitam.',
  ),
  Product(
    id: 11,
    name: 'Set Makeup Pemula',
    price: 199000,
    category: 'Kecantikan',
    rating: 4.3,
    sold: 1530,
    icon: Icons.brush,
    color: Colors.purple,
    description:
        'Paket makeup lengkap untuk pemula: bedak, lipstik, eyeshadow, blush on, dan kuas.',
  ),
  Product(
    id: 12,
    name: 'Laptop Ultrabook 14"',
    price: 4999000,
    category: 'Elektronik',
    rating: 4.9,
    sold: 310,
    icon: Icons.laptop,
    color: Colors.cyan,
    description:
        'Laptop tipis 14" dengan prosesor generasi terbaru, RAM 16GB, SSD 512GB, dan bobot hanya 1,3kg.',
  ),
];

/// Format angka menjadi Rupiah
String rupiah(int value) {
  final s = value.toString();
  final buf = StringBuffer();
  for (int i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) buf.write('.');
    buf.write(s[i]);
  }
  return 'Rp$buf';
}

//Homescreen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static const List<String> _titles = [
    'Beranda',
    'Live',
    'Notifikasi',
    'Profil Saya',
  ];

  int _index = 0;
  String _query = '';
  String _category = 'Semua';
  RangeValues _price = const RangeValues(0, kMaxPrice);

  bool get _filterActive =>
      _category != 'Semua' || _price.start > 0 || _price.end < kMaxPrice;

  List<Product> get _filtered {
    return kProducts.where((p) {
      final matchQuery = p.name.toLowerCase().contains(_query.toLowerCase());
      final matchCategory = _category == 'Semua' || p.category == _category;
      final matchPrice = p.price >= _price.start && p.price <= _price.end;
      return matchQuery && matchCategory && matchPrice;
    }).toList();
  }

  // AppBar
  PreferredSizeWidget _buildAppBar() {
    if (_index != 0) {
      return AppBar(
        backgroundColor: kOrange,
        foregroundColor: Colors.white,
        title: Text(_titles[_index]),
      );
    }

    return AppBar(
      backgroundColor: kOrange,
      foregroundColor: Colors.white,
      titleSpacing: 12,
      title: SizedBox(
        height: 40,
        child: TextField(
          onChanged: (v) => setState(() => _query = v),
          style: const TextStyle(color: Colors.black87, fontSize: 14),
          decoration: InputDecoration(
            hintText: 'Cari di ShopSmart',
            hintStyle: const TextStyle(color: Colors.black45, fontSize: 14),
            prefixIcon: const Icon(Icons.search, color: Colors.black45),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      actions: [
        // Tombol filter
        IconButton(
          tooltip: 'Filter',
          icon: Badge(
            smallSize: 8,
            isLabelVisible: _filterActive,
            child: const Icon(Icons.tune),
          ),
          onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
        ),
      ],
    );
  }

  Widget _buildBody() {
    switch (_index) {
      case 0:
        return _buildBeranda();
      case 1:
        return const _LiveTab();
      case 2:
        return const _NotificationTab();
      default:
        return const _ProfileTab();
    }
  }

  Widget _buildBeranda() {
    final products = _filtered;

    return Column(
      children: [
        if (_filterActive)
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Filter: $_category • ${rupiah(_price.start.round())} - ${rupiah(_price.end.round())}',
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                TextButton(
                  onPressed: () => setState(() {
                    _category = 'Semua';
                    _price = const RangeValues(0, kMaxPrice);
                  }),
                  child: const Text('Reset'),
                ),
              ],
            ),
          ),
        Expanded(
          child: products.isEmpty
              ? const Center(child: Text('Produk tidak ditemukan'))
              : GridView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.68,
                  ),
                  itemBuilder: (context, i) => _ProductCard(product: products[i]),
                ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(),
      endDrawer: _index == 0
          ? _FilterDrawer(
              category: _category,
              price: _price,
              onApply: (cat, range) => setState(() {
                _category = cat;
                _price = range;
              }),
            )
          : null,
      body: _buildBody(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        indicatorColor: kOrangeSoft,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: kOrange),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.live_tv_outlined),
            selectedIcon: Icon(Icons.live_tv, color: kOrange),
            label: 'Live',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications_outlined),
            selectedIcon: Icon(Icons.notifications, color: kOrange),
            label: 'Notifikasi',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person, color: kOrange),
            label: 'Profil Saya',
          ),
        ],
      ),
    );
  }
}


// END DRAWER
class _FilterDrawer extends StatefulWidget {
  final String category;
  final RangeValues price;
  final void Function(String category, RangeValues price) onApply;

  const _FilterDrawer({
    required this.category,
    required this.price,
    required this.onApply,
  });

  @override
  State<_FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<_FilterDrawer> {
  late String _cat;
  late RangeValues _range;

  @override
  void initState() {
    super.initState();
    _cat = widget.category;
    _range = widget.price;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: kOrange,
            padding: EdgeInsets.fromLTRB(
              16,
              MediaQuery.of(context).padding.top + 16,
              16,
              16,
            ),
            child: const Row(
              children: [
                Icon(Icons.tune, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  'Filter Produk',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text(
                  'Kategori',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: kCategories.map((c) {
                    return ChoiceChip(
                      label: Text(c),
                      selected: _cat == c,
                      selectedColor: kOrangeSoft,
                      onSelected: (_) => setState(() => _cat = c),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Rentang Harga',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  '${rupiah(_range.start.round())} - ${rupiah(_range.end.round())}',
                  style: const TextStyle(color: kOrange),
                ),
                RangeSlider(
                  values: _range,
                  min: 0,
                  max: kMaxPrice,
                  divisions: 50,
                  activeColor: kOrange,
                  labels: RangeLabels(
                    rupiah(_range.start.round()),
                    rupiah(_range.end.round()),
                  ),
                  onChanged: (v) => setState(() => _range = v),
                ),
              ],
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => setState(() {
                        _cat = 'Semua';
                        _range = const RangeValues(0, kMaxPrice);
                      }),
                      child: const Text('Reset'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton(
                      style: FilledButton.styleFrom(backgroundColor: kOrange),
                      onPressed: () {
                        widget.onApply(_cat, _range);
                        Navigator.pop(context); // tutup endDrawer
                      },
                      child: const Text('Terapkan'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// KARTU PRODUK
class _ProductCard extends StatelessWidget {
  final Product product;

  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        // Navigasi Stack
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProductDetailScreen(product: product),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: 'product-${product.id}',
                child: Container(
                  width: double.infinity,
                  color: product.color.withAlpha(30),
                  child: Icon(product.icon, size: 64, color: product.color),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 13),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    rupiah(product.price),
                    style: const TextStyle(
                      color: kOrange,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 14, color: Colors.amber),
                      const SizedBox(width: 2),
                      Text('${product.rating}',
                          style: const TextStyle(fontSize: 11)),
                      const Spacer(),
                      Text('${product.sold} terjual',
                          style: const TextStyle(
                              fontSize: 11, color: Colors.black54)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// DETAIL PRODUK
class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  void _showMessage(BuildContext context, String msg) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kOrange,
        foregroundColor: Colors.white,
        title: const Text('Detail Produk'),
      ),
      body: ListView(
        children: [
          Hero(
            tag: 'product-${product.id}',
            child: Container(
              height: 260,
              color: product.color.withAlpha(30),
              child: Icon(product.icon, size: 120, color: product.color),
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  rupiah(product.price),
                  style: const TextStyle(
                    color: kOrange,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  product.name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, size: 18, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text('${product.rating}'),
                    const SizedBox(width: 16),
                    Text('${product.sold} terjual',
                        style: const TextStyle(color: Colors.black54)),
                    const Spacer(),
                    Chip(
                      label: Text(product.category),
                      backgroundColor: kOrangeSoft,
                      side: BorderSide.none,
                      visualDensity: VisualDensity.compact,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Deskripsi Produk',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(product.description, style: const TextStyle(height: 1.5)),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              OutlinedButton.icon(
                onPressed: () =>
                    _showMessage(context, 'Ditambahkan ke keranjang'),
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text('Keranjang'),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton(
                  style: FilledButton.styleFrom(backgroundColor: kOrange),
                  onPressed: () =>
                      _showMessage(context, 'Memproses pembelian...'),
                  child: const Text('Beli Sekarang'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// TAB LIVE
class _LiveTab extends StatelessWidget {
  const _LiveTab();

  @override
  Widget build(BuildContext context) {
    final items = kProducts.take(5).toList();

    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, i) {
        final p = items[i];
        return Card(
          color: Colors.white,
          clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    color: p.color.withAlpha(30),
                    child: Icon(p.icon, size: 48, color: p.color),
                  ),
                  Positioned(
                    top: 6,
                    left: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'LIVE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Flash Sale ${p.name}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 6),
                      Text('ShopSmart Official',
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black54)),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.visibility,
                              size: 14, color: Colors.black45),
                          const SizedBox(width: 4),
                          Text('${(i + 1) * 873} menonton',
                              style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


// TAB NOTIFIKASI
class _NotificationTab extends StatelessWidget {
  const _NotificationTab();

  static const List<_Notif> _items = [
    _Notif(Icons.local_shipping, 'Pesanan dikirim',
        'Paket Anda sedang dalam perjalanan.', '10 menit lalu'),
    _Notif(Icons.local_offer, 'Voucher baru',
        'Diskon 20% untuk kategori Elektronik hari ini.', '1 jam lalu'),
    _Notif(Icons.flash_on, 'Flash Sale',
        'Flash Sale dimulai pukul 12.00. Jangan sampai terlewat!', '3 jam lalu'),
    _Notif(Icons.payment, 'Menunggu pembayaran',
        'Selesaikan pembayaran sebelum 24 jam.', 'Kemarin'),
    _Notif(Icons.star, 'Beri ulasan',
        'Bagaimana produk yang Anda terima? Beri penilaian.', '2 hari lalu'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _items.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, i) {
        final n = _items[i];
        return Container(
          color: Colors.white,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: kOrangeSoft,
              child: Icon(n.icon, color: kOrange),
            ),
            title: Text(n.title,
                style: const TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Text(n.body),
            trailing: Text(n.time,
                style: const TextStyle(fontSize: 11, color: Colors.black45)),
          ),
        );
      },
    );
  }
}

class _Notif {
  final IconData icon;
  final String title;
  final String body;
  final String time;

  const _Notif(this.icon, this.title, this.body, this.time);
}


// TAB PROFIL
class _ProfileTab extends StatelessWidget {
  const _ProfileTab();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Card(
            color: Colors.white,
            elevation: 3,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 28),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [kOrange, Color(0xFFFF8A65)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 54,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: kOrangeSoft,
                          child: Text(
                            'ISA',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: kOrange,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        kNama,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Mahasiswa $kJurusan',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      _InfoRow(Icons.person, 'Nama Pembuat', kNama),
                      Divider(height: 1),
                      _InfoRow(Icons.badge, 'NPM', kNpm),
                      Divider(height: 1),
                      _InfoRow(Icons.school, 'Jurusan', kJurusan),
                      Divider(height: 1),
                      _InfoRow(Icons.groups, 'Kelas', kKelas),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: Colors.white,
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.receipt_long, color: kOrange),
                  title: Text('Pesanan Saya'),
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.favorite_border, color: kOrange),
                  title: Text('Wishlist'),
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.settings, color: kOrange),
                  title: Text('Pengaturan'),
                  trailing: Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow(this.icon, this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: kOrange),
      title: Text(label,
          style: const TextStyle(fontSize: 12, color: Colors.black54)),
      subtitle: Text(
        value,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }
}