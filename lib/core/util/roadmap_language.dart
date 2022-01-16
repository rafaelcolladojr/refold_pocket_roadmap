extension LargeStringX on RoadmapLanguage {
  String toLargeString() {
    String value = '';
    switch (this) {
      case RoadmapLanguage.en:
        value = 'English';
        break;
      case RoadmapLanguage.es:
        value = 'Español';
        break;
      case RoadmapLanguage.jp:
        value = '日本語';
        break;
      case RoadmapLanguage.ko:
        value = '한국어';
        break;
    }
    return value;
  }
}

enum RoadmapLanguage { en, es, jp, ko }
