import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:err_rss_reader/domain/entity/article_details.dart';
import 'package:err_rss_reader/domain/usecases/get_article_details.dart';

part 'article_details_event.dart';
part 'article_details_state.dart';

class ArticleDetailsBloc
    extends Bloc<ArticleDetailsEvent, ArticleDetailsState> {
  final GetArticleDetails _getArticleDetails;

  ArticleDetailsBloc({
    required GetArticleDetails getArticleDetails,
  })  : _getArticleDetails = getArticleDetails,
        super(const ArticleDetailsInitial()) {
    on<LoadArticleDetailsEvent>(_onGetArticleDetailsEvent);
  }

  Future<void> _onGetArticleDetailsEvent(
    LoadArticleDetailsEvent event,
    Emitter<ArticleDetailsState> emit,
  ) async {
    emit(const ArticleDetailsLoading());

    final articleDetails =
        await _getArticleDetails(GetArticleDetailsParams(event.articleId));

    articleDetails.fold(
      (failure) =>
          emit(ArticleDetailsError(errorMessage: failure.errorMessage)),
      (articlesDetails) =>
          emit(ArticleDetailsLoadSuccess(articlesDetails: articlesDetails)),
    );
  }
}
