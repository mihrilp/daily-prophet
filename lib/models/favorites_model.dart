import 'package:flutter/material.dart';
import 'package:daily_prophet/models/news_model.dart';

class FavoritesModel extends ChangeNotifier {
  final List<NewsModel> _favorites = [];

  List<NewsModel> get items => _favorites;

  void add(NewsModel? news) {
    _favorites.add(news!);
    notifyListeners();
  }

  void remove(NewsModel news) {
    _favorites.remove(news);
    notifyListeners();
  }
}
