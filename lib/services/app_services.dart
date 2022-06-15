import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../constants/app_constants.dart';
import '../models/news_model.dart';

class Service {
  final Dio _dio;

  Service() : _dio = Dio(BaseOptions(baseUrl: AppConstants.BASE_URL));

  Future<List<NewsModel>?> fetcTopHeadlines() async {
    try {
      final response = await _dio
          .get("top-headlines?country=us&apiKey=${dotenv.env['API_KEY']}");
      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;
        if (data['articles'] is List) {
          return data['articles']
              .map<NewsModel>((item) => NewsModel.fromJson(item))
              .toList();
        }
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
    }
    return null;
  }
}
