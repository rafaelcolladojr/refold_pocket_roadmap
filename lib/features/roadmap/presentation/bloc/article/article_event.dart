abstract class ArticleEvent {}

class GetArticleEvent extends ArticleEvent {
  GetArticleEvent({required this.id});

  final String id;
}

class PopArticleEvent extends ArticleEvent {}
