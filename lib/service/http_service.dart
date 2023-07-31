import 'dart:convert';
import 'dart:io';
import 'package:flutter_news/models/news.dart';
import 'package:http/http.dart' as http;

class HttpService {
  final List<News> news = [];
  final String newsURL = 'https://newsapi.org/v2/top-headlines?country=us';

  Future<News> getNews() async {
    final response = await http.get(Uri.parse(newsURL), headers: {
      HttpHeaders.authorizationHeader: 'd21439bf503a43cba736e8ab333f6ab6'
    });
    if (response.statusCode == 200) {
      return News.fromJson(jsonDecode(response.body.toString()));
    } else {
      throw "Unable to fetch news!";
    }
  }
}
