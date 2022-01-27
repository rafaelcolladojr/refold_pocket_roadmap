import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/article_details_entity.dart';

class ArticleDetailsModel extends ArticleDetails {
  const ArticleDetailsModel({
    required String title,
    required String body,
  }) : super(title: title, body: body);

  factory ArticleDetailsModel.empty() => const ArticleDetailsModel(
        title: '',
        body: '',
      );
}
