import 'package:err_rss_reader/core/usecase/usecase.dart';
import 'package:err_rss_reader/core/utils/typedef.dart';
import 'package:err_rss_reader/domain/entity/article.dart';
import 'package:err_rss_reader/domain/repositories/articles_repository.dart';

class GetArticlesParams {
  final int page;

  const GetArticlesParams(this.page);
}

class GetArticles extends UsecaseWithParams<List<Article>, GetArticlesParams> {
  const GetArticles(this._articlesRepository);

  final ArticlesRepository _articlesRepository;

  @override
  ResultFuture<List<Article>> call(GetArticlesParams params) async =>
      _articlesRepository.getArticles(params);
}
