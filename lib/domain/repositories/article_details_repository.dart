import 'package:err_rss_reader/core/utils/typedef.dart';
import 'package:err_rss_reader/domain/entity/article_details.dart';
import 'package:err_rss_reader/domain/usecases/get_article_details.dart';

abstract class ArticleDetailsRepository {
  const ArticleDetailsRepository();

  ResultFuture<ArticleDetails> getArticleDetails(
      GetArticleDetailsParams params);
}
