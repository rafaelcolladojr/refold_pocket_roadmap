import 'package:equatable/equatable.dart';
import 'package:refold_pocket_roadmap/core/util/enums/roadmap_language.dart';
import 'package:refold_pocket_roadmap/core/util/enums/roadmap_type.dart';

class RoadmapThumbnail extends Equatable {
  const RoadmapThumbnail({
    required this.lang,
    required this.type,
    required this.enabled,
  });
  final RoadmapLanguage lang;
  final RoadmapType type;
  final bool enabled;

  @override
  List<Object?> get props => [lang, type, enabled];

  String toRoadmapId() {
    // ex. es_quickstart
    return '${lang == RoadmapLanguage.en ? "" : lang.toShortString() + "_"}$type';
  }
}
