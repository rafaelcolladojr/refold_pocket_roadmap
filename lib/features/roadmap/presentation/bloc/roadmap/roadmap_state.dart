import 'package:equatable/equatable.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/roadmap_entity.dart';

enum RoadmapStatus { initial, loading, success, failure }

class RoadmapState extends Equatable {
  const RoadmapState({
    required this.status,
    required this.roadmap,
  });

  final RoadmapStatus status;
  final Roadmap roadmap;

  RoadmapState copyWith({
    RoadmapStatus? status,
    Roadmap? roadmap,
  }) {
    return RoadmapState(
      status: status ?? this.status,
      roadmap: roadmap ?? this.roadmap,
    );
  }

  @override
  List<Object?> get props => [status, roadmap];
}
