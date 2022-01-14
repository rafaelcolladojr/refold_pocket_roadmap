import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/stage_details_entity.dart';

import 'article_model.dart';
import 'article_section_model.dart';

class StageDetailsModel extends StageDetails {
  StageDetailsModel({
    required ArticleModel overview,
    required List<ArticleSectionModel> articleSections,
  }) : super(overview: overview, articleSections: articleSections);

  factory StageDetailsModel.fromJson(Map<String, dynamic> json) =>
      StageDetailsModel(
        overview: ArticleModel.fromJson(json["overview"]),
        articleSections: List<ArticleSectionModel>.from(json["article-sections"]
            .map((x) => ArticleSectionModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "overview": (overview as ArticleModel).toJson(),
        "article-sections": List<dynamic>.from(
            articleSections.map((x) => (x as ArticleSectionModel).toJson())),
      };

  @override
  String toString() {
    String value = '$overview';
    for (var element in articleSections) {
      value += '\n$element';
    }
    return value;
  }
}
