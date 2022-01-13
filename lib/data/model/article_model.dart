import 'package:refold_pocket_roadmap/domain/entity/article_entity.dart';

class ArticleModel extends Article {
  ArticleModel({
    required String id,
    required String title,
    required String body,
  }) : super(id: id, title: title, body: body);

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  factory ArticleModel.empty() => ArticleModel(id: '', title: '', body: '');

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
      };

  @override
  String toString() {
    return 'id: $id, title: $title,\n$body';
  }
}
