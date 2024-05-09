import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:err_rss_reader/domain/entity/article.dart';
import 'package:err_rss_reader/domain/usecases/get_articles.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  final GetArticles _getArticles;
  int _currentPage = 1;
  bool _hasReachedMax = false;

  ArticlesBloc({
    required GetArticles getArticles,
  })  : _getArticles = getArticles,
        super(const ArticlesInitial()) {
    on<LoadArticlesEvent>(_onGetArticlesEvent);
    on<LoadMoreArticlesEvent>(_onLoadMoreArticles);
  }

  Future<void> _onGetArticlesEvent(
    LoadArticlesEvent event,
    Emitter<ArticlesState> emit,
  ) async {
    _currentPage = 1;
    emit(const ArticlesLoading());

    final articles = await _getArticles(GetArticlesParams(_currentPage));

    articles.fold(
      (failure) => emit(ArticlesError(errorMessage: failure.errorMessage)),
      (articles) => emit(ArticlesLoadSuccess(articles: articles)),
    );

    _currentPage++;
  }

  Future<void> _onLoadMoreArticles(
    LoadMoreArticlesEvent event,
    Emitter<ArticlesState> emit,
  ) async {
    if (state is ArticlesLoadingMore) return;
    emit(ArticlesLoadingMore(event.currentArticles));

    final result = await _getArticles(GetArticlesParams(_currentPage));
    result.fold(
      (failure) => emit(ArticlesError(errorMessage: failure.errorMessage)),
      (articles) => emit(ArticlesLoadSuccess(
          articles: [...event.currentArticles, ...articles],
          hasReachedMax: articles.length < 15)),
    );
    _currentPage++;
  }
}
