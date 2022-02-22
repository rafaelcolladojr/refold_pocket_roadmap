import 'package:equatable/equatable.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/article_entity.dart';

enum ArticleStatus { initial, loading, success, failure }

class ArticleState extends Equatable {
  const ArticleState({this.status = ArticleStatus.initial, this.article, this.prevArticleIds = const []});

  final ArticleStatus status;
  final Article? article;
  final List<String> prevArticleIds;

  ArticleState copyWith({
    ArticleStatus? status,
    Article? article,
    List<String>? prevArticleIds,
  }) {
    return ArticleState(
      status: status ?? this.status,
      article: article ?? this.article,
      prevArticleIds: prevArticleIds ?? this.prevArticleIds,
    );
  }

  @override
  List<Object?> get props => [status, article, prevArticleIds];
}
