import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/article_section_entity.dart';

import 'article_model.dart';

class ArticleSectionModel extends ArticleSection {
  ArticleSectionModel({
    required String id,
    required String title,
    required List<ArticleModel> articles,
  }) : super(id: id, title: title, articles: articles);

  factory ArticleSectionModel.fromJson(Map<String, dynamic> json) =>
      ArticleSectionModel(
        id: json["id"],
        title: json["title"],
        articles: List<ArticleModel>.from(
            json["articles"].map((x) => ArticleModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "articles": List<ArticleModel>.from(
            articles.map((x) => (x as ArticleModel).toJson())),
      };

  @override
  String toString() {
    String value = '$title';
    for (var element in articles) {
      value += '\n$element';
    }
    return value;
  }
}
