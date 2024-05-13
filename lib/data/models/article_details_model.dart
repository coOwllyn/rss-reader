import 'dart:convert';

import 'package:err_rss_reader/core/utils/typedef.dart';
import 'package:err_rss_reader/domain/entity/article_details.dart';

class ArticleDetailsModel extends ArticleDetails {
  const ArticleDetailsModel({
    required super.id,
    required super.author,
    required super.pubDate,
    required super.title,
    required super.description,
    required super.image,
  });

  const ArticleDetailsModel.empty()
      : this(
          id: '1',
          author: '_empty.author',
          pubDate: '_empty.pubDate',
          title: '_empty.title',
          description: '_empty.description',
          image: '_empty.image',
        );

  factory ArticleDetailsModel.fromJson(String source) =>
      ArticleDetailsModel.fromMap(jsonDecode(source) as DataMap);

  ArticleDetailsModel.fromMap(DataMap map)
      : this(
          id: map['id'] as String,
          author: map['author'] as String,
          pubDate: map['pubDate'] as String,
          title: map['title'] as String,
          description: map['description'] as String,
          image: map['media:thumbnail'] as String,
        );

  ArticleDetailsModel copyWith({
    String? id,
    String? author,
    String? pubDate,
    String? title,
    String? description,
    String? image,
  }) {
    return ArticleDetailsModel(
      id: id ?? this.id,
      author: author ?? this.author,
      pubDate: pubDate ?? this.pubDate,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }

  DataMap toMap() => {
        'id': id,
        'author': author,
        'pubDate': pubDate,
        'title': title,
        'description': description,
        'image': image,
      };

  String toJson() => jsonEncode(toMap());
}
