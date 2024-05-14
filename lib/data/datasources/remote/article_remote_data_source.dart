import 'package:err_rss_reader/core/errors/exceptions.dart';
import 'package:err_rss_reader/core/utils/app_consts.dart';
import 'package:err_rss_reader/data/models/article_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

abstract class ArticlesRemoteDataSource {
  Future<List<ArticleModel>> getArticles({int page = 1});
}

const String perPage = "5";
const String rss = '/rss';

class ArticlesRemoteDataSrcImpl implements ArticlesRemoteDataSource {
  const ArticlesRemoteDataSrcImpl(this._client);

  final http.Client _client;

  @override
  Future<List<ArticleModel>> getArticles({int page = 1}) async {
    try {
      final response = await _client.get(Uri.https(kMainUrl, rss));
      debugPrint('get articles ======  ${response.body}');
      if (response.statusCode != 200) {
        throw APIException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }

      final xmlDocument = xml.XmlDocument.parse(response.body);
      final items = xmlDocument.findAllElements('item');

      return items.map((item) => ArticleModel.fromXml(item)).toList();
    } on APIException catch (e) {
      throw APIException(message: e.message, statusCode: e.statusCode);
    } catch (e) {
      debugPrint("$e");
      throw Exception("Unknown error occurred");
    }
  }
}
