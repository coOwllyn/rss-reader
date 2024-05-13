import 'package:equatable/equatable.dart';

class ArticleDetails extends Equatable {
  const ArticleDetails({
    required this.id,
    required this.editor,
    required this.heading,
    required this.lead,
    required this.body,
    required this.image,
  });

  const ArticleDetails.empty()
      : this(
          id: 1,
          editor: '_empty.editor',
          heading: '_empty.heading',
          lead: '_empty.lead',
          body: '_empty.body',
          image: '_empty.image',
        );

  final int id;
  final String editor;
  final String heading;
  final String lead;
  final String body;
  final String image;

  @override
  List<Object?> get props => [
        id,
        editor,
        heading,
        lead,
        body,
        image,
      ];
}
