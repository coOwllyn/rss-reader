import 'package:err_rss_reader/core/usecase/usecase.dart';
import 'package:err_rss_reader/core/utils/typedef.dart';
import 'package:err_rss_reader/domain/entity/article_details.dart';
import 'package:err_rss_reader/domain/repositories/article_details_repository.dart';

class GetArticleDetailsParams {
  final String articleId;

  const GetArticleDetailsParams(this.articleId);
}

class GetArticleDetails
    extends UsecaseWithParams<ArticleDetails, GetArticleDetailsParams> {
  const GetArticleDetails(this._articleDetailsRepository);

  final ArticleDetailsRepository _articleDetailsRepository;

  @override
  ResultFuture<ArticleDetails> call(GetArticleDetailsParams params) async =>
      _articleDetailsRepository.getArticleDetails(params);
}
