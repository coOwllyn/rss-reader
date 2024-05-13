import 'package:err_rss_reader/core/services/injection_container.dart';
import 'package:err_rss_reader/presentation/screens/article_details_screen/article_details_bloc/article_details_bloc.dart';
import 'package:err_rss_reader/presentation/screens/article_details_screen/article_details_screen.dart';
import 'package:err_rss_reader/presentation/screens/home_feed_screen/articles_bloc/articles_bloc.dart';
import 'package:err_rss_reader/presentation/screens/home_feed_screen/home_feed_screen.dart';
import 'package:err_rss_reader/presentation/screens/splash_screen/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const _initialLocation = '/';
  static const _splashScreen = '/';
  static const _homeScreen = '/home';
  static const _articleDetailsScreen = '/articleDetails';

  //{consts end}

  static final AppRouter _instance = AppRouter._privateConstructor();
  static late GoRouter router;

  static String get splashScreen => _splashScreen;

  static String get homeScreen => _homeScreen;

  static String get articleDetailsScreen => _articleDetailsScreen;

  //{getters end}

  AppRouter._privateConstructor() {
    _initialize();
  }

  factory AppRouter.init() {
    return _instance;
  }

  void _initialize({String initialLocation = _initialLocation}) {
    router = GoRouter(
      initialLocation: initialLocation,
      routes: <GoRoute>[
        GoRoute(
          path: _splashScreen,
          name: 'SplashScreen',
          builder: (context, state) => const SplashScreen(),
        ),

        GoRoute(
          path: _homeScreen,
          name: 'HomeScreen',
          builder: (context, state) => BlocProvider(
            create: (context) =>
                sl<ArticlesBloc>()..add(const LoadArticlesEvent()),
            child: const HomeFeedScreen(),
          ),
        ),

        GoRoute(
          path: _articleDetailsScreen,
          name: 'ArticleDetailsScreen',
          builder: (context, state) => BlocProvider(
            create: (context) => sl<ArticleDetailsBloc>()
              ..add(LoadArticleDetailsEvent(state.extra as String)),
            child: ArticleDetailsScreen(),
          ),
        ),
        //{routes end}
      ],
    );
  }
}
