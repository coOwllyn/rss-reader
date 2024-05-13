import 'dart:convert';

import 'package:err_rss_reader/core/utils/typedef.dart';
import 'package:err_rss_reader/domain/entity/article_details.dart';

class ArticleDetailsModel extends ArticleDetails {
  const ArticleDetailsModel({
    required super.id,
    required super.editor,
    required super.heading,
    required super.lead,
    required super.body,
    required super.image,
  });

  const ArticleDetailsModel.empty()
      : this(
          id: 1,
          editor: '_empty.editor',
          heading: '_empty.heading',
          lead: '_empty.lead',
          body: '_empty.body',
          image: '_empty.image',
        );

  factory ArticleDetailsModel.fromJson(String source) =>
      ArticleDetailsModel.fromMap(jsonDecode(source) as DataMap);

  ArticleDetailsModel.fromMap(DataMap map)
      : this(
          id: map['id'] as int,
          editor: map['editor'] as String,
          heading: map['heading'] as String,
          lead: map['lead'] as String,
          body: map['body'] as String,
          image: map['photos'][0]['photoUrlOriginal'] as String,
        );

  ArticleDetailsModel copyWith({
    int? id,
    String? editor,
    String? heading,
    String? lead,
    String? body,
    String? image,
  }) {
    return ArticleDetailsModel(
      id: id ?? this.id,
      editor: editor ?? this.editor,
      heading: heading ?? this.heading,
      lead: lead ?? this.lead,
      body: body ?? this.body,
      image: image ?? this.image,
    );
  }

  DataMap toMap() => {
        'id': id,
        'editor': editor,
        'heading': heading,
        'lead': lead,
        'body': body,
        'image': image,
      };

  String toJson() => jsonEncode(toMap());
}
