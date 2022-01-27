import 'package:equatable/equatable.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/article_entity.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/article_section_entity.dart';

class StageDetails extends Equatable {
  const StageDetails({
    required this.overview,
    required this.articleSections,
  });

  final Article overview;
  final List<ArticleSection> articleSections;

  @override
  List<Object?> get props => [overview, articleSections];
}
