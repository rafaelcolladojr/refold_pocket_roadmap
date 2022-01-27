import 'package:refold_pocket_roadmap/core/util/enums/roadmap_language.dart';
import 'package:refold_pocket_roadmap/core/util/enums/roadmap_type.dart';

class RoadmapPageArgs {
  final RoadmapType type;
  final RoadmapLanguage lang;

  RoadmapPageArgs({required this.type, required this.lang});
}
