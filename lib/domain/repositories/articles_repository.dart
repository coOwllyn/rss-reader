import 'package:err_rss_reader/core/utils/typedef.dart';
import 'package:err_rss_reader/domain/entity/article.dart';
import 'package:err_rss_reader/domain/usecases/get_articles.dart';
import 'package:err_rss_reader/domain/usecases/save_articles.dart';

abstract class ArticlesRepository {
  const ArticlesRepository();

  ResultFuture<List<Article>> getArticles(GetArticlesParams params);

  Future<void> saveArticles(SaveArticleParams params);
}
