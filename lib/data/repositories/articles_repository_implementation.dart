import 'package:dartz/dartz.dart';
import 'package:err_rss_reader/core/errors/exceptions.dart';
import 'package:err_rss_reader/core/errors/failure.dart';
import 'package:err_rss_reader/core/utils/typedef.dart';
import 'package:err_rss_reader/data/datasources/local/article_local_data_source.dart';
import 'package:err_rss_reader/data/datasources/remote/article_remote_data_source.dart';
import 'package:err_rss_reader/domain/entity/article.dart';
import 'package:err_rss_reader/domain/repositories/articles_repository.dart';
import 'package:err_rss_reader/domain/usecases/get_articles.dart';
import 'package:err_rss_reader/domain/usecases/save_articles.dart';

class ArticlesRepositoryImplementation implements ArticlesRepository {
  const ArticlesRepositoryImplementation(
      this._remoteDataSource, this._localDataSource);

  final ArticlesRemoteDataSource _remoteDataSource;
  final ArticlesLocalDataSource _localDataSource;

  @override
  ResultFuture<List<Article>> getArticles(GetArticlesParams params) async {
    try {
      final result = await _remoteDataSource.getArticles(page: params.page);
      await _localDataSource
          .saveArticles(SaveArticleParams(result, params.page));
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  Future<void> saveArticles(SaveArticleParams params) async {
    await _localDataSource.saveArticles(params);
  }
}
