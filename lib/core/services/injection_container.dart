import 'package:err_rss_reader/data/datasources/article_remote_data_source.dart';
import 'package:err_rss_reader/data/repositories/articles_repository_implementation.dart';
import 'package:err_rss_reader/domain/repositories/articles_repository.dart';
import 'package:err_rss_reader/domain/usecases/get_articles.dart';
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

    // Use cases
    ..registerLazySingleton(() => GetArticles(sl()))

    // Repositories
    ..registerLazySingleton<ArticlesRepository>(
        () => ArticlesRepositoryImplementation(sl()))

    // Data Sources
    ..registerLazySingleton<ArticlesRemoteDataSource>(
        () => ArticlesRemoteDataSrcImpl(sl()))

    // External Dependencies
    ..registerLazySingleton(http.Client.new);
}
