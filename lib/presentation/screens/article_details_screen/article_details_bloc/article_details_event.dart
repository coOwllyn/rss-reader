part of 'article_details_bloc.dart';

class ArticleDetailsEvent extends Equatable {
  const ArticleDetailsEvent();

  @override
  List<Object?> get props => [];
}

class LoadArticleDetailsEvent extends ArticleDetailsEvent {
  const LoadArticleDetailsEvent(this.articleId);

  final String articleId;

  @override
  List<Object?> get props => [];
}
