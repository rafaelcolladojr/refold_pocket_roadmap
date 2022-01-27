extension LargeStringX on RoadmapType {
  String toLargeString() {
    String value = '';
    switch (this) {
      case RoadmapType.detailed:
        value = 'Detailed Roadmap';
        break;
      case RoadmapType.simplified:
        value = 'Simplified Roadmap';
        break;
      case RoadmapType.quickstart:
        value = 'Quickstart Guide';
        break;
    }

    return value;
  }
}

extension ShortStringX on RoadmapType {
  String toShortString() {
    String last = toString().split('.').last;
    return last == 'detailed' ? 'roadmap' : last;
  }
}

extension FromStringX on RoadmapType {
  RoadmapType fromString(String str) {
    return RoadmapType.values.firstWhere((e) => e.toString() == 'RoadmapType.$str');
  }
}

enum RoadmapType { detailed, simplified, quickstart }
