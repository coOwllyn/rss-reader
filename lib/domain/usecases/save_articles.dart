import 'package:err_rss_reader/core/usecase/usecase.dart';
import 'package:err_rss_reader/core/utils/typedef.dart';
import 'package:err_rss_reader/data/datasources/local/article_local_data_source.dart';
import 'package:err_rss_reader/domain/entity/article.dart';

class SaveArticleParams {
  final List<Article> articles;
  final int page;

  const SaveArticleParams(this.articles, this.page);
}

class SaveArticles extends UsecaseWithParams<void, SaveArticleParams> {
  const SaveArticles(this._articlesLocalDataSource);

  final ArticlesLocalDataSource _articlesLocalDataSource;

  @override
  ResultFuture<void> call(SaveArticleParams params) async =>
      _articlesLocalDataSource.saveArticles(params);
}
