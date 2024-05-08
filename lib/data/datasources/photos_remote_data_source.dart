import 'dart:convert';

import 'package:err_rss_reader/core/errors/exceptions.dart';
import 'package:err_rss_reader/core/utils/app_consts.dart';
import 'package:err_rss_reader/data/models/article_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

abstract class ArticlesRemoteDataSource {
  Future<List<ArticleModel>> getArticles({int page = 1});
}

const String perPage = "5";
const kApiKey = '0a596ff1adab5442a354557c0531a732';
const kGetPhotosEndpoint = '/services/rest/';
const Map<String, String> kGetPhotosParams = {
  'api_key': kApiKey,
  'method': 'flickr.photos.getRecent',
  // 'user_id': '135168164@N03',
  'format': 'json',
  'nojsoncallback': '1',
  'extras': 'url_s, owner_name',
  'per_page': perPage,
};

class ArticlesRemoteDataSrcImpl implements ArticlesRemoteDataSource {
  const ArticlesRemoteDataSrcImpl(this._client);

  final http.Client _client;

  @override
  Future<List<ArticleModel>> getArticles({int page = 1}) async {
    try {
      final uri = Uri.https(kBaseUrl, kGetPhotosEndpoint,
          {...kGetPhotosParams, 'page': page.toString()});
      final response = await _client.get(uri);
      debugPrint('get articles ======  ${response.body}');
      if (response.statusCode != 200) {
        throw APIException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }
      final Map<String, dynamic> decodedJson = json.decode(response.body);
      final List<dynamic> articles = decodedJson['articles']['article'];
      return articles
          .map((articleData) => ArticleModel.fromMap(articleData))
          .toList();
    } on APIException catch (e) {
      throw APIException(message: e.message, statusCode: e.statusCode);
    } catch (e) {
      debugPrint("$e");
      throw Exception("Unknown error occurred");
    }
  }
}
