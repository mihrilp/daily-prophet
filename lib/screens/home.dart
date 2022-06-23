import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/news_model.dart';
import "../services/app_services.dart";
import '../widgets/news_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<NewsModel>? _items;
  bool _isLoading = true;
  late final Service _service = Service();
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _fetchNews();
    _controller = TextEditingController();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _fetchNews() async {
    _items = await _service.fetcTopHeadlines();
    _changeLoading();
  }

  Future<void> handleSearch() async {
    _changeLoading();
    _items = await _service.fetchNewsByKeyword(_controller.text);
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          "assets/images/logo.svg",
          height: 45,
        ),
      ),
      body: SizedBox(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text("News from all over the world",
                  style: TextStyle(fontSize: 20, color: Colors.grey)),
            ),
            _searchBar(),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text("Top Headlines",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
            ),
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      itemCount: _items?.length ?? 0,
                      itemBuilder: (context, index) {
                        return NewsCard(model: _items?[index]);
                      },
                    ),
            ),
          ],
        ),
      )),
      extendBody: true,
    );
  }

  TextField _searchBar() {
    return TextField(
        controller: _controller,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          hintText: 'Search',
        ),
        keyboardType: TextInputType.text,
        onEditingComplete: () => handleSearch());
  }
}
