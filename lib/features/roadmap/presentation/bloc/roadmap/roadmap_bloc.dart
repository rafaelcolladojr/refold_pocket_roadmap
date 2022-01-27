import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refold_pocket_roadmap/core/error/failure.dart';
import 'package:refold_pocket_roadmap/core/params/get_article_params.dart';
import 'package:refold_pocket_roadmap/core/params/get_roadmap_params.dart';
import 'package:refold_pocket_roadmap/core/util/enums/roadmap_language.dart';
import 'package:refold_pocket_roadmap/core/util/enums/roadmap_type.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/article_entity.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/roadmap_entity.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/repository/roadmap_repository.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/bloc/roadmap/roadmap_event.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/bloc/roadmap/roadmap_state.dart';

class RoadmapBloc extends Bloc<RoadmapEvent, RoadmapState> {
  RoadmapBloc(RoadmapRepository roadmapRepository)
      : _roadmapRepository = roadmapRepository,
        super(const RoadmapState()) {
    on<GetRoadmapEvent>(_onGetRoadmapEvent);
  }

  final RoadmapRepository _roadmapRepository;

  Future<void> _onGetRoadmapEvent(GetRoadmapEvent event, Emitter<RoadmapState> emitter) async {
    Either<Failure, Roadmap> result = await _roadmapRepository.getRoadmap(GetRoadmapParams(type: event.type.toShortString(), lang: event.lang.toShortString()));
    result.fold(
      (left) => emitter(const RoadmapState(status: RoadmapStatus.failure)),
      (right) => emitter(RoadmapState(status: RoadmapStatus.success, roadmap: right)),
    );
  }

  Future<void> _onGetArticleEvent(GetArticleEvent event, Emitter<RoadmapState> emitter) async {
    Either<Failure, Article> roadmap = await _roadmapRepository.getArticle(GetArticleParams(id: event.id));
  }
}
