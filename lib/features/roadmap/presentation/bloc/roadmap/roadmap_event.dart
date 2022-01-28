import 'package:refold_pocket_roadmap/core/util/enums/roadmap_language.dart';
import 'package:refold_pocket_roadmap/core/util/enums/roadmap_type.dart';

abstract class RoadmapEvent {}

class GetRoadmapEvent extends RoadmapEvent {
  GetRoadmapEvent({required this.type, required this.lang});
  final RoadmapType type;
  final RoadmapLanguage lang;
}
