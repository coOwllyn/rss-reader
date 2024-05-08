import 'package:dartz/dartz.dart';
import 'package:err_rss_reader/core/errors/exceptions.dart';
import 'package:err_rss_reader/core/errors/failure.dart';
import 'package:err_rss_reader/core/utils/typedef.dart';
import 'package:err_rss_reader/data/datasources/photos_remote_data_source.dart';
import 'package:err_rss_reader/domain/entity/article.dart';
import 'package:err_rss_reader/domain/repositories/articles_repository.dart';
import 'package:err_rss_reader/domain/usecases/get_articles.dart';

class ArticlesRepositoryImplementation implements ArticlesRepository {
  const ArticlesRepositoryImplementation(this._remoteDataSource);

  final ArticlesRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<List<Article>> getArticles(GetArticlesParams params) async {
    try {
      final result = await _remoteDataSource.getArticles(page: params.page);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
}
