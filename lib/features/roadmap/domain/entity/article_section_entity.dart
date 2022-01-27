import 'package:equatable/equatable.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/article_entity.dart';

class ArticleSection extends Equatable {
  const ArticleSection({
    required this.id,
    required this.title,
    required this.articles,
  });

  final String id;
  final String title;
  final List<Article> articles;

  @override
  List<Object?> get props => [id, title, articles];
}
