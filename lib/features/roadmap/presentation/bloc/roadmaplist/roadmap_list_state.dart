import 'package:equatable/equatable.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/roadmap_entity.dart';

enum RoadmapListStatus { initial, loading, success, failure }

class RoadmapListState extends Equatable {
  const RoadmapListState({
    this.status = RoadmapListStatus.initial,
    this.roadmaps = const [],
  });

  final RoadmapListStatus status;
  final List<Roadmap> roadmaps;

  RoadmapListState copyWith({
    RoadmapListStatus? status,
    List<Roadmap>? roadmaps,
  }) {
    return RoadmapListState(
      status: status ?? this.status,
      roadmaps: roadmaps ?? this.roadmaps,
    );
  }

  @override
  List<Object?> get props => [status, roadmaps];
}
