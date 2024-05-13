import 'package:equatable/equatable.dart';

class ArticleDetails extends Equatable {
  const ArticleDetails({
    required this.id,
    required this.author,
    required this.pubDate,
    required this.title,
    required this.description,
    required this.image,
  });

  const ArticleDetails.empty()
      : this(
          id: '1',
          author: '_empty.author',
          pubDate: '_empty.pubDate',
          title: '_empty.title',
          description: '_empty.description',
          image: '_empty.image',
        );

  final String id;
  final String author;
  final String pubDate;
  final String title;
  final String description;
  final String image;

  @override
  List<Object?> get props => [
        id,
        author,
        pubDate,
        title,
        description,
        image,
      ];
}
