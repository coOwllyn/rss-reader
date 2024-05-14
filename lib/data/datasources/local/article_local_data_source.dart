import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:err_rss_reader/core/errors/failure.dart';
import 'package:err_rss_reader/core/utils/typedef.dart';
import 'package:err_rss_reader/data/datasources/local/app_database.dart';
import 'package:err_rss_reader/domain/entity/article.dart';
import 'package:err_rss_reader/domain/usecases/get_articles.dart';
import 'package:err_rss_reader/domain/usecases/save_articles.dart';
import 'package:flutter/material.dart';

abstract class ArticlesLocalDataSource {
  ResultFuture<List<Article>> getSavedArticles(GetArticlesParams params);

  ResultFuture<void> saveArticles(SaveArticleParams params);

  ResultFuture<void> clearSavedArticles();
}

class ArticlesLocalDataSrcImpl implements ArticlesLocalDataSource {
  final AppDatabase _database;

  ArticlesLocalDataSrcImpl(this._database);

  @override
  ResultFuture<List<Article>> getSavedArticles(GetArticlesParams params) async {
    final articles = await (_database.select(_database.articles)
          ..where((tbl) => tbl.forPage.equals(params.page)))
        .get();
    if (articles.isEmpty) {
      return const Left(EmptyDBFailure());
    }
    return Right(articles
        .map((article) => Article(
            id: article.articleId,
            title: article.title,
            pubDate: article.pubDate,
            description: article.description,
            image: article.image))
        .toList());
  }

  @override
  ResultFuture<void> saveArticles(SaveArticleParams params) async {
    try {
      await _database.batch((batch) {
        batch.insertAll(
          _database.articles,
          [
            for (var item in params.articles)
              ArticlesCompanion.insert(
                  articleId: item.id,
                  title: item.title,
                  pubDate: item.pubDate,
                  description: item.description,
                  forPage: params.page,
                  image: item.image)
          ],
          mode: InsertMode.insertOrReplace,
        );
      });
      return const Right(null);
    } catch (e) {
      debugPrint('Error writing to db ----> $e');
      return const Left(DBWriteFailure());
    }
  }

  @override
  ResultFuture<void> clearSavedArticles() async {
    try {
      await _database.transaction(() async {
        await _database.articles.deleteAll();
      });
      return const Right(null);
    } catch (e) {
      debugPrint('error deleting from database -----> $e');
      return const Left(DBWriteFailure());
    }
  }
}
