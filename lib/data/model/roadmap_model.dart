import 'dart:convert';

import 'package:refold_pocket_roadmap/domain/entity/roadmap_entity.dart';

import 'article_model.dart';
import 'article_section_model.dart';
import 'stage_model.dart';

String roadmapToJson(RoadmapModel data) => json.encode(data.toJson());

class RoadmapModel extends Roadmap {
  RoadmapModel({
    required String type,
    required String lang,
    required List<StageModel> stages,
  }) : super(type: type, lang: lang, stages: stages);

  factory RoadmapModel.fromJson(Map<String, dynamic> json) => RoadmapModel(
        type: json["type"],
        lang: json["lang"],
        stages: List<StageModel>.from(
            json["stages"].map((x) => StageModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "lang": lang,
        "stages":
            List<dynamic>.from(stages.map((x) => (x as StageModel).toJson())),
      };

  List<ArticleModel> getAllArticles() {
    List<ArticleModel> articles = List.empty(growable: true);
    for (StageModel stage in (stages as List<StageModel>)) {
      ArticleModel overview = (stage.details.overview as ArticleModel);
      articles.add(overview);
      for (ArticleSectionModel section
          in (stage.details.articleSections as List<ArticleSectionModel>)) {
        articles.addAll(section.articles as List<ArticleModel>);
      }
    }
    return articles;
  }
}
