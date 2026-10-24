import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

const String kApiKey = 'd9c9353afe08429987b01ae3693d4925';

//Berita Jepang 
const String kHeadlinesUrl =
    'https://newsapi.org/v2/top-headlines?country=jp&pageSize=50&apiKey=$kApiKey';

void main() => runApp(const JapanNewsApp());

class JapanNewsApp extends StatelessWidget {
  const JapanNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Berita Jepang',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: const Color.fromARGB(255, 56, 117, 239), useMaterial3: true),
      home: const NewsPage(),
    );
  }
}

/// Model data berita.
class NewsItem {
  final String title;
  final String description;
  final String url;
  final String? imageUrl;
  final String source;
  final String publishedAt;

  NewsItem({
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.source,
    required this.publishedAt,
  });

  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      imageUrl: json['urlToImage'],
      source: (json['source'] != null ? json['source']['name'] : null) ?? '',
      publishedAt: json['publishedAt'] ?? '',
    );
  }
}

/// Mengambil berita Jepang dari NewsAPI.
class NewsService {
  Future<List<NewsItem>> fetchNews() async {
    final headlines = await _request(Uri.parse(kHeadlinesUrl));
    if (headlines.isNotEmpty) return headlines;

    final fallback = Uri.https('newsapi.org', '/v2/everything', {
      'q': '日本 OR Japan',
      'sortBy': 'publishedAt',
      'pageSize': '50',
      'apiKey': kApiKey,
    });
    return _request(fallback);
  }

  Future<List<NewsItem>> _request(Uri uri) async {
    final response = await http.get(uri).timeout(const Duration(seconds: 15));
    final body = jsonDecode(utf8.decode(response.bodyBytes));

    if (response.statusCode != 200 || body['status'] != 'ok') {
      throw Exception(body['message'] ?? 'Gagal memuat berita');
    }

    return (body['articles'] as List)
        .map((a) => NewsItem.fromJson(a as Map<String, dynamic>))
        .where((n) => n.title.isNotEmpty && n.title != '[Removed]')
        .toList();
  }
}

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final NewsService _service = NewsService();
  final ScrollController _scrollController = ScrollController();

  List<NewsItem> _news = [];
  bool _loading = true;
  String? _error;
  bool _showToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _loadNews();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Tombol "kembali ke atas"
  void _onScroll() {
    final shouldShow = _scrollController.offset > 300;
    if (shouldShow != _showToTop) {
      setState(() => _showToTop = shouldShow);
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  // Dipakai saat pertama dibuka DAN saat pull-to-refresh.
  Future<void> _loadNews() async {
    try {
      final data = await _service.fetchNews();
      if (!mounted) return;
      setState(() {
        _news = data;
        _error = null;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString().replaceFirst('Exception: ', '');
        _loading = false;
      });
    }
  }

  Future<void> _openLink(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) return;
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tidak dapat membuka tautan')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berita Jepang'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: _buildBody(),
      floatingActionButton: AnimatedScale(
        scale: _showToTop ? 1 : 0,
        duration: const Duration(milliseconds: 200),
        child: FloatingActionButton(
          onPressed: _scrollToTop,
          tooltip: 'Kembali ke atas',
          child: const Icon(Icons.arrow_upward),
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return RefreshIndicator(
      onRefresh: _loadNews,
      child: _error != null
          ? _buildError()
          : _news.isEmpty
              ? _buildEmpty()
              : _buildList(),
    );
  }

  Widget _buildError() {
    return ListView(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline, size: 48),
                  const SizedBox(height: 12),
                  Text(_error!, textAlign: TextAlign.center),
                  const SizedBox(height: 12),
                  const Text('Tarik ke bawah untuk mencoba lagi'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmpty() {
    return ListView(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: const Center(
            child: Text('Belum ada berita.\nTarik ke bawah untuk memuat ulang.',
                textAlign: TextAlign.center),
          ),
        ),
      ],
    );
  }

  Widget _buildList() {
    return ListView.separated(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(12),
      itemCount: _news.length + 1, // +1 untuk atribusi di bagian bawah
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        if (index == _news.length) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: GestureDetector(
                onTap: () => _openLink('https://newsapi.org'),
                child: Text(
                  'Powered by News API',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          );
        }
        return _NewsCard(item: _news[index], onTap: _openLink);
      },
    );
  }
}

class _NewsCard extends StatelessWidget {
  final NewsItem item;
  final void Function(String url) onTap;

  const _NewsCard({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => onTap(item.url),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (item.imageUrl != null && item.imageUrl!.isNotEmpty)
              Image.network(
                item.imageUrl!,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const SizedBox(
                    height: 180,
                    child: Center(child: CircularProgressIndicator()),
                  );
                },
              ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  if (item.description.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Text(
                      item.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  const SizedBox(height: 8),
                  Text(
                    [item.source, item.publishedAt]
                        .where((s) => s.isNotEmpty)
                        .join(' • '),
                    style: textTheme.bodySmall,
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