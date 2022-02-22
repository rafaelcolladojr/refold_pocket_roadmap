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
    on<PopArticleEvent>(_onPopArticleEvent);
  }

  final RoadmapRepository _roadmapRepository;

  Future<void> _onGetArticleEvent(GetArticleEvent event, Emitter<ArticleState> emitter) async {
    printIdStack();
    Either<Failure, Article> result = await _roadmapRepository.getArticle(GetArticleParams(id: event.id));
    result.fold(
      (left) => emitter(const ArticleState(status: ArticleStatus.failure)),
      (right) {
        // Push current ArticleId to prev list
        List<String> newIds = List.of(state.prevArticleIds, growable: true);
        if (state.article != null) {
          newIds.add(state.article!.id);
        }
        emitter(state.copyWith(
          status: ArticleStatus.success,
          article: right,
          prevArticleIds: newIds,
        ));
      },
    );
  }

  Future<void> _onPopArticleEvent(PopArticleEvent event, Emitter<ArticleState> emitter) async {
    printIdStack();
    // Fetch preivous article if exists
    try {
      var latestId = state.prevArticleIds.removeLast();
      Either<Failure, Article> result = await _roadmapRepository.getArticle(GetArticleParams(id: latestId));
      result.fold((left) => null, (right) => emitter(state.copyWith(status: ArticleStatus.success, article: right)));
    } on RangeError {/*Do nothing*/}
  }

  void printIdStack() {
    print(state.prevArticleIds);
  }
}
