import 'package:err_rss_reader/core/resources/app_strings.dart';
import 'package:err_rss_reader/core/router/app_router.dart';
import 'package:err_rss_reader/domain/entity/article.dart';
import 'package:err_rss_reader/presentation/screens/home_feed_screen/articles_bloc/articles_bloc.dart';
import 'package:err_rss_reader/presentation/screens/home_feed_screen/widgets/article_card.dart';
import 'package:err_rss_reader/presentation/style/app_colors.dart';
import 'package:err_rss_reader/presentation/widgets/loading_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ArticleList extends StatefulWidget {
  const ArticleList({
    super.key,
    required this.articles,
    required this.isLoadingMore,
  });

  final List<Article> articles;
  final bool isLoadingMore;

  @override
  State<ArticleList> createState() => _PhotoListState();
}

class _PhotoListState extends State<ArticleList> {
  final ScrollController _listScrollController = ScrollController();

  @override
  void initState() {
    _listScrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    final maxScroll = _listScrollController.position.maxScrollExtent;
    final currentScroll = _listScrollController.position.pixels;
    final scrollThreshold = maxScroll * 0.95;

    if (currentScroll > scrollThreshold && !widget.isLoadingMore) {
      context.read<ArticlesBloc>().add(LoadMoreArticlesEvent(widget.articles));
    }
  }

  @override
  Widget build(BuildContext context) {
    final articlesBloc = BlocProvider.of<ArticlesBloc>(context);

    return RefreshIndicator(
      onRefresh: () async {
        articlesBloc.add(const LoadArticlesEvent());
      },
      color: AppColors.blueMain,
      backgroundColor: AppColors.bgLight,
      child: Center(
        child: ListView.builder(
          controller: _listScrollController,
          padding: const EdgeInsets.only(top: 10),
          itemCount: widget.isLoadingMore
              ? widget.articles.length + 1
              : widget.articles.length,
          itemBuilder: (context, index) {
            if (index == (widget.articles.length)) {
              return const SizedBox(
                  height: 200,
                  child: LoadingColumn(message: AppStrings.loadingArticles));
            } else {
              final article = widget.articles[index];
              return ArticleCard(
                onTap: () {
                  context.go(AppRouter.articleDetailsScreen, extra: article.id);
                },
                title: article.title,
                image: article.image,
                pubDate: article.pubDate,
              );
            }
          },
        ),
      ),
    );
  }
}
