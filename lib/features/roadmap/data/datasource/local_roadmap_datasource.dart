import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:refold_pocket_roadmap/core/error/exception.dart';
import 'package:refold_pocket_roadmap/core/util/enums/roadmap_language.dart';
import 'package:refold_pocket_roadmap/core/util/enums/roadmap_type.dart';
import 'package:refold_pocket_roadmap/features/roadmap/data/model/article_model.dart';
import 'package:refold_pocket_roadmap/features/roadmap/data/model/roadmap_model.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/article_entity.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/roadmap_entity.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/roadmap_thumbnail_entity.dart';

abstract class LocalRoadmapDatasource {
  Future<Roadmap> getRoadmap(String id);
  Future<Article> getArticle(String id);

  Future<Map<RoadmapLanguage, List<RoadmapThumbnail>>> getRoadmapThumbnails();
}

class LocalRoadmapDatasourceImpl implements LocalRoadmapDatasource {
  LocalRoadmapDatasourceImpl();

  @override
  Future<Map<RoadmapLanguage, List<RoadmapThumbnail>>> getRoadmapThumbnails() async {
    String path = 'assets/json/available_roadmaps.json';
    Map<RoadmapLanguage, List<RoadmapThumbnail>> thumbnails = {};
    try {
      String contents = await rootBundle.loadString(path);
      Map<String, dynamic> json = jsonDecode(contents);
      List<dynamic> languages = json['languages'] ?? [];

      for (dynamic lang in languages) {
        RoadmapLanguage roadmapLang = RoadmapLanguage.en.fromString(lang['lang']);
        thumbnails[roadmapLang] = [];
        List<dynamic> roadmaps = lang['roadmaps'];

        for (dynamic roadmap in roadmaps) {
          RoadmapType roadmapType = RoadmapType.detailed.fromString(roadmap['type']);
          bool enabled = roadmap['enabled'];
          RoadmapThumbnail entry = RoadmapThumbnail(lang: roadmapLang, type: roadmapType, enabled: enabled);
          thumbnails[roadmapLang]!.add(entry);
        }
      }
    } on Error {
      throw FileException();
    }

    return thumbnails;
  }

  @override
  Future<Roadmap> getRoadmap(String id) async {
    // Use ID for roadmap json file path
    String path = 'assets/json/$id.json';

    String roadmapJson = await rootBundle.loadString(path);
    RoadmapModel roadmap = RoadmapModel.fromJson(jsonDecode(roadmapJson));

    return roadmap;
  }

  @override
  Future<Article> getArticle(String id) async {
    // Use ID for article json file path
    String path = 'assets/json/$id.json';

    String articleJson = '';
    try {
      await rootBundle.loadString(path);
    } on FlutterError {
      throw FileException();
    }

    ArticleModel article = ArticleModel.fromJson(jsonDecode(articleJson));

    return article;
  }
}
