import 'package:err_rss_reader/data/datasources/article_details_remote_data_source.dart';
import 'package:err_rss_reader/data/datasources/article_remote_data_source.dart';
import 'package:err_rss_reader/data/repositories/article_details_repository_implementation.dart';
import 'package:err_rss_reader/data/repositories/articles_repository_implementation.dart';
import 'package:err_rss_reader/domain/repositories/article_details_repository.dart';
import 'package:err_rss_reader/domain/repositories/articles_repository.dart';
import 'package:err_rss_reader/domain/usecases/get_article_details.dart';
import 'package:err_rss_reader/domain/usecases/get_articles.dart';
import 'package:err_rss_reader/presentation/screens/article_details_screen/article_details_bloc/article_details_bloc.dart';
import 'package:err_rss_reader/presentation/screens/home_feed_screen/articles_bloc/articles_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  sl
    // App Logic
    ..registerFactory(() => ArticlesBloc(
          getArticles: sl(),
        ))
    ..registerFactory(() => ArticleDetailsBloc(
          getArticleDetails: sl(),
        ))

    // Use cases
    ..registerLazySingleton(() => GetArticles(sl()))
    ..registerLazySingleton(() => GetArticleDetails(sl()))

    // Repositories
    ..registerLazySingleton<ArticlesRepository>(
        () => ArticlesRepositoryImplementation(sl()))
    ..registerLazySingleton<ArticleDetailsRepository>(
        () => ArticleDetailsRepositoryImplementation(sl()))

    // Data Sources
    ..registerLazySingleton<ArticlesRemoteDataSource>(
        () => ArticlesRemoteDataSrcImpl(sl()))
    ..registerLazySingleton<ArticleDetailsRemoteDataSource>(
        () => ArticleDetailsRemoteDataSrcImpl(sl()))

    // External Dependencies
    ..registerLazySingleton(http.Client.new);
}
