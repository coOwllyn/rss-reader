import 'dart:convert';

import 'package:err_rss_reader/core/utils/typedef.dart';
import 'package:err_rss_reader/domain/entity/article.dart';

class ArticleModel extends Article {
  const ArticleModel({
    required super.id,
    required super.owner,
    required super.time,
    required super.title,
    required super.desc,
    required super.url,
  });

  const ArticleModel.empty()
      : this(
          id: '1',
          owner: '_empty.ownername',
          time: '_empty.time',
          title: '_empty.title',
          desc: '_empty.desc',
          url: '_empty.url',
        );

  factory ArticleModel.fromJson(String source) =>
      ArticleModel.fromMap(jsonDecode(source) as DataMap);

  ArticleModel.fromMap(DataMap map)
      : this(
          id: map['id'] as String,
          owner: map['ownername'] as String,
          time: map['time'] as String,
          title: map['title'] as String,
          desc: map['desc'] as String,
          url: map['url_s'] as String,
        );

  ArticleModel copyWith({
    String? id,
    String? owner,
    String? time,
    String? title,
    String? desc,
    String? url,
  }) {
    return ArticleModel(
      id: id ?? this.id,
      owner: owner ?? this.owner,
      time: time ?? this.time,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      url: url ?? this.url,
    );
  }

  DataMap toMap() => {
        'id': id,
        'ownername': owner,
        'time': time,
        'title': title,
        'desc': desc,
        'url_s': url,
      };

  String toJson() => jsonEncode(toMap());
}
