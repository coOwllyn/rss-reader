import 'package:equatable/equatable.dart';

class Article extends Equatable {
  const Article({
    required this.id,
    required this.owner,
    required this.time,
    required this.title,
    required this.desc,
    required this.url,
  });

  const Article.empty()
      : this(
          id: '1',
          owner: '_empty.owner',
          time: '_empty.time',
          title: '_empty.title',
          desc: '_empty.desc',
          url: '_empty.url',
        );

  final String id;
  final String owner;
  final String time;
  final String title;
  final String desc;
  final String url;

  @override
  List<Object?> get props => [
        id,
        owner,
        time,
        title,
        desc,
        url,
      ];
}
