import 'package:err_rss_reader/core/usecase/usecase.dart';
import 'package:err_rss_reader/core/utils/typedef.dart';
import 'package:err_rss_reader/data/datasources/local/article_local_data_source.dart';

class ClearArticles extends UsecaseWithoutParams<void> {
  const ClearArticles(this._articlesLocalDataSource);

  final ArticlesLocalDataSource _articlesLocalDataSource;

  @override
  ResultFuture<void> call() async =>
      _articlesLocalDataSource.clearSavedArticles();
}
