import 'dart:io';
import 'package:dio/dio.dart';
import '../constants/app_constants.dart';
import '../models/news_model.dart';

class Service {
  Future<List<NewsModel>?> fetcNews() async {
    try {
      final response = await Dio().get(AppConstants.BASE_URL);
      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;
        if (data['articles'] is List) {
          return data['articles']
              .map<NewsModel>((item) => NewsModel.fromJson(item))
              .toList();
        }
      }
    } catch (e) {
      print("Error: $e");
    }
    return null;
  }
}
