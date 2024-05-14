import 'package:dartz/dartz.dart';
import 'package:err_rss_reader/core/errors/exceptions.dart';
import 'package:err_rss_reader/core/errors/failure.dart';
import 'package:err_rss_reader/core/utils/typedef.dart';
import 'package:err_rss_reader/data/datasources/remote/article_details_remote_data_source.dart';
import 'package:err_rss_reader/domain/entity/article_details.dart';
import 'package:err_rss_reader/domain/repositories/article_details_repository.dart';
import 'package:err_rss_reader/domain/usecases/get_article_details.dart';

class ArticleDetailsRepositoryImplementation
    implements ArticleDetailsRepository {
  const ArticleDetailsRepositoryImplementation(this._remoteDataSource);

  final ArticleDetailsRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<ArticleDetails> getArticleDetails(
      GetArticleDetailsParams params) async {
    try {
      final result = await _remoteDataSource.getArticleDetails(
          articleId: params.articleId);
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
}
