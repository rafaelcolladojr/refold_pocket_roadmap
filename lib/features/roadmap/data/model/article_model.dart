import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/article_entity.dart';

class ArticleModel extends Article {
  const ArticleModel({
    required String id,
    required String thumbTitle,
    required String title,
    required String body,
  }) : super(id: id, thumbTitle: thumbTitle, title: title, body: body);

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        id: json["id"],
        thumbTitle: json['thumbTitle'],
        title: json["title"],
        body: json["body"],
      );

  factory ArticleModel.empty() => const ArticleModel(id: '', thumbTitle: '', title: '', body: '');

  Map<String, dynamic> toJson() => {
        "id": id,
        "thumbTitle": thumbTitle,
        "title": title,
        "body": body,
      };

  @override
  String toString() {
    return 'id: $id,\nthumbTitle: $thumbTitle, title: $title,\n$body';
  }
}
