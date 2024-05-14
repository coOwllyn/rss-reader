part of 'articles_bloc.dart';

class ArticlesEvent extends Equatable {
  const ArticlesEvent();

  @override
  List<Object?> get props => [];
}

class LoadArticlesEvent extends ArticlesEvent {
  const LoadArticlesEvent();

  @override
  List<Object?> get props => [];
}

class LoadMoreArticlesEvent extends ArticlesEvent {
  const LoadMoreArticlesEvent(this.currentArticles);

  final List<Article> currentArticles;

  @override
  List<Object?> get props => [currentArticles];
}

class FetchMoreArticles extends ArticlesEvent {
  const FetchMoreArticles();

  @override
  List<Object?> get props => [];
}

class RefreshArticles extends ArticlesEvent {
  const RefreshArticles();
}
