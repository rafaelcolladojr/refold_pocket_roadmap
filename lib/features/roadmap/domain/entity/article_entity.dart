import 'package:equatable/equatable.dart';

class Article extends Equatable {
  const Article({
    required this.id,
    required this.thumbTitle,
    required this.title,
    required this.body,
  });

  final String id;
  final String thumbTitle;
  final String title;
  final String body;

  @override
  List<Object?> get props => [id, thumbTitle, title, body];
}
