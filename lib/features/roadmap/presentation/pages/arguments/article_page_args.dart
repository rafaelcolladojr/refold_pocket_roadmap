import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/article_entity.dart';

class ArticlePageArgs {
  final Article? article;
  final String? articleId;

  const ArticlePageArgs({this.article, this.articleId});
}
