import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_api/data/Model/categories_new_model.dart';
import 'package:flutter_api/data/Model/news_channel_headlines_model.dart';
import 'package:http/http.dart' as http;

class NewsRepository {

  Future<NewsChannelsHeadlinesModel> fetchNewChannelHeadlinesApi(String channelName)async{
    String url = 'https://newsapi.org/v2/top-headlines?sources=${channelName}&apiKey=69418a59f60b4861b26ca700757532c1' ;
    print(url);
    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }
    if(response.statusCode == 200){
      final body = jsonDecode(response.body);
      return NewsChannelsHeadlinesModel.fromJson(body);
    }
    throw Exception('Error');
  }
  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category)async{
    String url = 'https://newsapi.org/v2/everything?q=${category}&apiKey=69418a59f60b4861b26ca700757532c1' ;
    print(url);
    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }
    if(response.statusCode == 200){
      final body = jsonDecode(response.body);
      return CategoriesNewsModel.fromJson(body);
    }
    throw Exception('Error');
  }
}