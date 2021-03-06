import 'package:daily_prophet/models/favorites_model.dart';
import 'package:daily_prophet/widgets/news_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('My Favorites',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600))),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Consumer<FavoritesModel>(
            builder: (context, value, child) => value.items.isNotEmpty
                ? ListView.builder(
                    itemCount: value.items.length,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    itemBuilder: (context, index) =>
                        NewsCard(model: value.items[index]))
                : const Center(
                    child: Text('No favorites added.'),
                  ),
          ),
        ));
  }
}
