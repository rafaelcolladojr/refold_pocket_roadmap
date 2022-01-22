import 'package:equatable/equatable.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/roadmap_thumbnail_entity.dart';

enum RoadmapListStatus { initial, loading, success, failure }

class RoadmapListState extends Equatable {
  const RoadmapListState({
    this.status = RoadmapListStatus.initial,
    this.thumbnails = const [],
  });

  final RoadmapListStatus status;
  final List<RoadmapThumbnail> thumbnails;

  RoadmapListState copyWith({
    RoadmapListStatus? status,
    List<RoadmapThumbnail>? thumbnails,
  }) {
    return RoadmapListState(
      status: status ?? this.status,
      thumbnails: thumbnails ?? this.thumbnails,
    );
  }

  @override
  List<Object?> get props => [status, thumbnails];
}
