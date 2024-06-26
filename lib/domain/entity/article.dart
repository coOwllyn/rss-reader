import 'package:equatable/equatable.dart';

class Article extends Equatable {
  const Article({
    required this.id,
    required this.pubDate,
    required this.title,
    required this.description,
    required this.image,
  });

  const Article.empty()
      : this(
          id: '1',
          pubDate: '_empty.pubDate',
          title: '_empty.title',
          description: '_empty.description',
          image: '_empty.image',
        );

  final String id;
  final String pubDate;
  final String title;
  final String description;
  final String image;

  @override
  List<Object?> get props => [
        id,
        pubDate,
        title,
        description,
        image,
      ];
}
