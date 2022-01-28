import 'package:equatable/equatable.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/article_entity.dart';

enum ArticleStatus { initial, loading, success, failure }

class ArticleState extends Equatable {
  const ArticleState({this.status = ArticleStatus.initial, this.article});

  final ArticleStatus status;
  final Article? article;

  ArticleState copyWith({
    ArticleStatus? status,
    Article? article,
  }) {
    return ArticleState(
      status: status ?? this.status,
      article: article ?? this.article,
    );
  }

  @override
  List<Object?> get props => [status, article];
}
