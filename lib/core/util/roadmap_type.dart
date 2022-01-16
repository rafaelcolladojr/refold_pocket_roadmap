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

enum RoadmapType { detailed, simplified, quickstart }
