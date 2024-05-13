import 'package:err_rss_reader/core/resources/app_images.dart';
import 'package:err_rss_reader/core/resources/app_strings.dart';
import 'package:err_rss_reader/presentation/screens/home_feed_screen/articles_bloc/articles_bloc.dart';
import 'package:err_rss_reader/presentation/screens/home_feed_screen/widgets/article_list.dart';
import 'package:err_rss_reader/presentation/style/app_colors.dart';
import 'package:err_rss_reader/presentation/widgets/loading_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeFeedScreen extends StatelessWidget {
  const HomeFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void getArticles() {
      context.read<ArticlesBloc>().add(const LoadArticlesEvent());
    }

    return Scaffold(
      backgroundColor: AppColors.bgLight,
      appBar: AppBar(
        title: SvgPicture.asset(
          AppImages.logoSVG,
          fit: BoxFit.fitHeight,
          height: 50,
        ),
        centerTitle: true,
        backgroundColor: AppColors.bgLight,
        scrolledUnderElevation: 0,
      ),
      body: BlocConsumer<ArticlesBloc, ArticlesState>(
        listener: (context, state) {
          if (state is ArticlesError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          } else if (state is ArticlesInitial) {
            getArticles();
          }
        },
        builder: (context, state) {
          if (state is ArticlesLoading) {
            return const LoadingColumn(message: AppStrings.loadingArticles);
          }
          if (state is ArticlesLoadSuccess) {
            return ArticleList(articles: state.articles, isLoadingMore: false);
          }
          if (state is ArticlesLoadingMore) {
            return ArticleList(articles: state.articles, isLoadingMore: true);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
