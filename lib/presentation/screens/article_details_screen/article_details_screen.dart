import 'package:err_rss_reader/core/resources/app_strings.dart';
import 'package:err_rss_reader/presentation/screens/article_details_screen/article_details_bloc/article_details_bloc.dart';
import 'package:err_rss_reader/presentation/style/app_colors.dart';
import 'package:err_rss_reader/presentation/style/app_text_style.dart';
import 'package:err_rss_reader/presentation/widgets/html_text.dart';
import 'package:err_rss_reader/presentation/widgets/loading_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.blueMain,
          ),
          splashColor: AppColors.textLight,
          splashRadius: 20,
          onPressed: () {
            GoRouter.of(context).go('/home');
          },
          padding: const EdgeInsets.only(left: 10),
        ),
        scrolledUnderElevation: 0,
      ),
      backgroundColor: AppColors.bgLight,
      body: BlocConsumer<ArticleDetailsBloc, ArticleDetailsState>(
        listener: (context, state) {
          if (state is ArticleDetailsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
            // } else if (state is ArticleDetailsInitial) {
            //   getArticlesDetails();
          }
        },
        builder: (context, state) {
          if (state is ArticleDetailsLoading) {
            return const LoadingColumn(message: AppStrings.loadingArticles);
          }
          if (state is ArticleDetailsLoadSuccess) {
            return SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      state.articlesDetails.heading,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      style: getHeaderStyle(
                        fontSize: 18,
                        color: AppColors.textLight,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Image.network(
                        state.articlesDetails.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),
                    HtmlText(
                      state.articlesDetails.lead,
                      style: getHeaderStyle(
                        fontSize: 14,
                        color: AppColors.textLight,
                      ),
                    ),
                    const SizedBox(height: 10),
                    HtmlText(
                      state.articlesDetails.body,
                      style: getBodyStyle(
                        fontSize: 14,
                        color: AppColors.textLight,
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (state.articlesDetails.editor.isNotEmpty)
                      Text(
                        'Toimetaja: ${state.articlesDetails.editor}',
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        style: getHeaderStyle(
                          fontSize: 16,
                          color: AppColors.textLight,
                        ),
                      ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
