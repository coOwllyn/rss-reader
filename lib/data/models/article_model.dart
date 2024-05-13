import 'dart:convert';

import 'package:err_rss_reader/core/utils/typedef.dart';
import 'package:err_rss_reader/domain/entity/article.dart';
import 'package:xml/xml.dart' as xml;

class ArticleModel extends Article {
  const ArticleModel({
    required super.id,
    required super.pubDate,
    required super.title,
    required super.description,
    required super.image,
  });

  const ArticleModel.empty()
      : this(
          id: '1',
          pubDate: '_empty.pubDate',
          title: '_empty.title',
          description: '_empty.description',
          image: '_empty.image',
        );

  factory ArticleModel.fromJson(String source) =>
      ArticleModel.fromMap(jsonDecode(source) as DataMap);

  factory ArticleModel.fromXml(xml.XmlElement element) {
    final pubDate = element.findElements('pubDate').first.innerText;
    final title = element.findElements('title').first.innerText;
    final description = element.findElements('description').first.innerText;
    final link = element.findElements('link').first.innerText;
    final image =
        element.findElements('media:thumbnail').first.getAttribute('url');

    return ArticleModel(
      id: Uri.parse(link).pathSegments[0],
      pubDate: pubDate,
      title: title,
      description: description,
      image: image ?? '',
    );
  }

  ArticleModel.fromMap(DataMap map)
      : this(
          id: map['id'] as String,
          pubDate: map['pubDate'] as String,
          title: map['title'] as String,
          description: map['description'] as String,
          image: map['media:thumbnail'] as String,
        );

  ArticleModel copyWith({
    String? id,
    String? pubDate,
    String? title,
    String? description,
    String? image,
  }) {
    return ArticleModel(
      id: id ?? this.id,
      pubDate: pubDate ?? this.pubDate,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }

  DataMap toMap() => {
        'id': id,
        'pubDate': pubDate,
        'title': title,
        'description': description,
        'image': image,
      };

  String toJson() => jsonEncode(toMap());
}
