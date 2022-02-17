import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refold_pocket_roadmap/core/error/failure.dart';
import 'package:refold_pocket_roadmap/core/params/get_article_params.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/article_entity.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/repository/roadmap_repository.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/bloc/article/article_event.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/bloc/article/article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc(RoadmapRepository roadmapRepository)
      : _roadmapRepository = roadmapRepository,
        super(const ArticleState()) {
    on<GetArticleEvent>(_onGetArticleEvent);
  }

  final RoadmapRepository _roadmapRepository;

  Future<void> _onGetArticleEvent(GetArticleEvent event, Emitter<ArticleState> emitter) async {
    Either<Failure, Article> result = await _roadmapRepository.getArticle(GetArticleParams(id: event.id));
    result.fold(
      (left) => emitter(const ArticleState(status: ArticleStatus.failure)),
      (right) => emitter(ArticleState(status: ArticleStatus.success, article: right)),
    );
  }
}
