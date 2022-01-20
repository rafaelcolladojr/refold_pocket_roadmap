abstract class RoadmapEvent {}

class GetRoadmapEvent extends RoadmapEvent {
  GetRoadmapEvent({required this.type, required this.lang});
  final String type;
  final String lang;
}

class GetArticleEvent extends RoadmapEvent {
  GetArticleEvent({required this.id});

  final String id;
}

class GetRoadmapListEvent extends RoadmapEvent {}
