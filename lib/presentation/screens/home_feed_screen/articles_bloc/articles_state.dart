part of 'articles_bloc.dart';

abstract class ArticlesState extends Equatable {
  const ArticlesState();

  @override
  List<Object> get props => [];
}

class ArticlesInitial extends ArticlesState {
  const ArticlesInitial();
}

class ArticlesLoading extends ArticlesState {
  const ArticlesLoading();
}

class ArticlesLoadingMore extends ArticlesState {
  const ArticlesLoadingMore(this.articles);

  final List<Article> articles;

  @override
  List<Object> get props => articles.map((article) => article.id).toList();
}

class ArticlesLoadSuccess extends ArticlesState {
  const ArticlesLoadSuccess(
      {required this.articles, this.hasReachedMax = false});

  final List<Article> articles;
  final bool hasReachedMax;

  @override
  List<Object> get props => articles.map((article) => article.id).toList();
}

class ArticlesError extends ArticlesState {
  const ArticlesError({required this.errorMessage});

  final String errorMessage;

  @override
  List<String> get props => [errorMessage];
}
