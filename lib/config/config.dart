import 'package:refold_pocket_roadmap/core/util/roadmap_language.dart';
import 'package:refold_pocket_roadmap/core/util/roadmap_type.dart';

const Map<RoadmapLanguage, List<RoadmapType>> kAvailableRoadmaps = {
  RoadmapLanguage.en: [RoadmapType.detailed, RoadmapType.simplified],
  RoadmapLanguage.es: [RoadmapType.quickstart, RoadmapType.simplified],
  RoadmapLanguage.jp: [RoadmapType.quickstart],
  RoadmapLanguage.ko: [RoadmapType.quickstart],
};
