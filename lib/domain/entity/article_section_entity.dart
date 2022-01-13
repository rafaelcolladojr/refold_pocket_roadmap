import 'package:refold_pocket_roadmap/domain/entity/article_entity.dart';

class ArticleSection {
  ArticleSection({
    required this.id,
    required this.title,
    required this.articles,
  });

  String id;
  String title;
  List<Article> articles;
}
