part of 'article_details_bloc.dart';

abstract class ArticleDetailsState extends Equatable {
  const ArticleDetailsState();

  @override
  List<Object> get props => [];
}

class ArticleDetailsInitial extends ArticleDetailsState {
  const ArticleDetailsInitial();
}

class ArticleDetailsLoading extends ArticleDetailsState {
  const ArticleDetailsLoading();
}

class ArticleDetailsLoadSuccess extends ArticleDetailsState {
  const ArticleDetailsLoadSuccess({required this.articlesDetails});

  final ArticleDetails articlesDetails;

  @override
  List<Object> get props => [articlesDetails];
}

class ArticleDetailsError extends ArticleDetailsState {
  const ArticleDetailsError({required this.errorMessage});

  final String errorMessage;

  @override
  List<String> get props => [errorMessage];
}
