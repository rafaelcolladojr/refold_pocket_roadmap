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
      case RoadmapLanguage.fr:
        value = 'Français';
        break;
      case RoadmapLanguage.de:
        value = 'Deutsch';
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

extension ShortStringX on RoadmapLanguage {
  String toShortString() {
    return toString().split('.').last;
  }
}

extension FromStringX on RoadmapLanguage {
  RoadmapLanguage fromString(String str) {
    return RoadmapLanguage.values.firstWhere((e) => e.toString() == 'RoadmapLanguage.$str');
  }
}

enum RoadmapLanguage { en, es, fr, de, jp, ko }
