import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:err_rss_reader/domain/entity/article.dart';
import 'package:err_rss_reader/domain/usecases/clear_articles.dart';
import 'package:err_rss_reader/domain/usecases/get_articles.dart';
import 'package:err_rss_reader/domain/usecases/save_articles.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  final GetArticles _getArticles;
  final GetDBArticles _getDBArticles;
  final SaveArticles _saveArticles;
  final ClearArticles _clearArticles;
  static const int initialPage = 1;
  int _currentPage = initialPage;

  ArticlesBloc({
    required GetArticles getArticles,
    required GetDBArticles getDBArticles,
    required SaveArticles saveArticles,
    required ClearArticles clearArticles,
  })  : _getArticles = getArticles,
        _saveArticles = saveArticles,
        _getDBArticles = getDBArticles,
        _clearArticles = clearArticles,
        super(const ArticlesInitial()) {
    on<LoadArticlesEvent>(_onGetArticlesEvent);
    on<LoadMoreArticlesEvent>(_onLoadMoreArticles);
    on<RefreshArticles>(_onRefreshArticles);
  }

  Future<void> _onGetArticlesEvent(
    LoadArticlesEvent event,
    Emitter<ArticlesState> emit,
  ) async {
    _currentPage = initialPage;
    emit(const ArticlesLoading());
    final dbArticles = await _getDBArticles(GetArticlesParams(_currentPage));
    final dbResult = dbArticles.fold((fail) => null, (articles) => articles);
    if (dbResult != null && dbResult.isNotEmpty) {
      emit(ArticlesLoadSuccess(articles: dbResult));
      return;
    }
    final articles = await _getArticles(GetArticlesParams(_currentPage));
    articles.fold(
        (failure) => emit(ArticlesError(errorMessage: failure.errorMessage)),
        (articles) async {
      emit(ArticlesLoadSuccess(articles: articles));
      await _saveArticles(SaveArticleParams(articles, _currentPage));
    });
  }

  Future<void> _onLoadMoreArticles(
    LoadMoreArticlesEvent event,
    Emitter<ArticlesState> emit,
  ) async {
    _currentPage++;
    if (state is ArticlesLoadingMore) return;
    emit(ArticlesLoadingMore(event.currentArticles));
    final dbArticles = await _getDBArticles(GetArticlesParams(_currentPage));
    final dbResult = dbArticles.fold((fail) => null, (articles) => articles);
    if (dbResult != null && dbResult.isNotEmpty) {
      emit(ArticlesLoadSuccess(
        articles: [...event.currentArticles, ...dbResult],
        hasReachedMax: dbResult.length < 15,
      ));
      return;
    }
    final result = await _getArticles(GetArticlesParams(_currentPage));
    result.fold(
      (failure) => emit(ArticlesError(errorMessage: failure.errorMessage)),
      (articles) async {
        emit(ArticlesLoadSuccess(
          articles: [...event.currentArticles, ...articles],
          hasReachedMax: articles.length < 15,
        ));
        await _saveArticles(SaveArticleParams(articles, _currentPage));
      },
    );
  }

  Future<void> _onRefreshArticles(
      RefreshArticles event, Emitter<ArticlesState> emit) async {
    await _clearArticles();
    add(const LoadArticlesEvent());
  }
}
