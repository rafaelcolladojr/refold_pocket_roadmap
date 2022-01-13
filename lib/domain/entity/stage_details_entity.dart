import 'package:refold_pocket_roadmap/domain/entity/article_entity.dart';
import 'package:refold_pocket_roadmap/domain/entity/article_section_entity.dart';

class StageDetails {
  StageDetails({
    required this.overview,
    required this.articleSections,
  });

  Article overview;
  List<ArticleSection> articleSections;
}
