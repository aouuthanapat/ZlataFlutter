

import 'package:flutter_api/data/Model/categories_new_model.dart';
import 'package:flutter_api/data/Model/news_channel_headlines_model.dart';
import 'package:flutter_api/domain/Repository/news_repository.dart';

class NewsViewModel {

  final _rep = NewsRepository();
  Future<NewsChannelsHeadlinesModel> fetchNewChannelHeadlinesApi(String channelName) async{
    final response = await _rep.fetchNewChannelHeadlinesApi(channelName);
    return response ;
  }
  Future<CategoriesNewsModel> fetchCategoriesNewsApi (String category) async{
    final response = await _rep.fetchCategoriesNewsApi(category);
    return response ;
  }
}