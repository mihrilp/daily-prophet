import 'package:flutter/material.dart';
import '../models/news_model.dart';
import '../widgets/search_bar.dart';
import "../services/app_services.dart";

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<NewsModel>? _items;
  bool _isLoading = true;
  late final Service _service = Service();

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    _items = await _service.fetcNews();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Appcent News App'),
        ),
        body: SizedBox(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SearchBar(),
              Expanded(
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        itemCount: _items?.length ?? 0,
                        itemBuilder: (context, index) {
                          return _PostCard(model: _items?[index]);
                        },
                      ),
              ),
            ],
          ),
        )));
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    Key? key,
    required NewsModel? model,
  })  : _model = model,
        super(key: key);

  final NewsModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {},
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.description ?? ''),
      ),
    );
  }
}
