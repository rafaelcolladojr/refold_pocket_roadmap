import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refold_pocket_roadmap/core/error/failure.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/roadmap_entity.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/repository/roadmap_repository.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/bloc/roadmaplist/roadmap_list_event.dart';
import 'package:refold_pocket_roadmap/features/roadmap/presentation/bloc/roadmaplist/roadmap_list_state.dart';

class RoadmapListBloc extends Bloc<RoadmapListEvent, RoadmapListState> {
  RoadmapListBloc(RoadmapRepository roadmapRepository)
      : _roadmapRepository = roadmapRepository,
        super(const RoadmapListState()) {
    on<GetRoadmapListEvent>(_onGetRoadmapList);
  }

  final RoadmapRepository _roadmapRepository;

  Future<void> _onGetRoadmapList(
      GetRoadmapListEvent event, Emitter<RoadmapListState> emitter) async {
    Either<Failure, List<Roadmap>> result =
        await _roadmapRepository.getRoadmapList();
  }
}
