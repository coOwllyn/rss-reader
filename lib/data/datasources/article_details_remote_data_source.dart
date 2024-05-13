import 'dart:convert';

import 'package:err_rss_reader/core/errors/exceptions.dart';
import 'package:err_rss_reader/core/utils/app_consts.dart';
import 'package:err_rss_reader/data/models/article_details_model.dart';
import 'package:err_rss_reader/domain/entity/article_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class ArticleDetailsRemoteDataSource {
  Future<ArticleDetails> getArticleDetails({required String articleId});
}

const kGetArticleDetailsEndpoint = '/api/content/get/';

class ArticleDetailsRemoteDataSrcImpl
    implements ArticleDetailsRemoteDataSource {
  const ArticleDetailsRemoteDataSrcImpl(this._client);

  final http.Client _client;

  @override
  Future<ArticleDetails> getArticleDetails({required String articleId}) async {
    try {
      final uri = Uri.https(kDataUrl, kGetArticleDetailsEndpoint + articleId);
      final response = await _client.get(uri);
      debugPrint('get article details ======  ${response.body}');
      if (response.statusCode != 200) {
        throw APIException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }
      final Map<String, dynamic> decodedJson = json.decode(response.body);
      final articleData = decodedJson['article'];
      return ArticleDetailsModel.fromMap(articleData);
    } on APIException catch (e) {
      throw APIException(message: e.message, statusCode: e.statusCode);
    } catch (e) {
      debugPrint("$e");
      throw Exception("Unknown error occurred");
    }
  }
}
