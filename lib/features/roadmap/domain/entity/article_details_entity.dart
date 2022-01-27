import 'package:equatable/equatable.dart';

class ArticleDetails extends Equatable {
  const ArticleDetails({
    required this.title,
    required this.body,
  });

  final String title;
  final String body;

  @override
  List<Object?> get props => [title, body]; // Body of the article in HTML format
}
