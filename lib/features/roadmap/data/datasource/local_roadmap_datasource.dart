import 'dart:convert';
import 'dart:io';

import 'package:refold_pocket_roadmap/config/config.dart';
import 'package:refold_pocket_roadmap/core/error/exception.dart';
import 'package:refold_pocket_roadmap/core/util/roadmap_language.dart';
import 'package:refold_pocket_roadmap/core/util/roadmap_type.dart';
import 'package:refold_pocket_roadmap/features/roadmap/data/model/article_model.dart';
import 'package:refold_pocket_roadmap/features/roadmap/data/model/roadmap_model.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/article_entity.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/roadmap_entity.dart';

abstract class LocalRoadmapDatasource {
  Future<Roadmap> getRoadmap(String id);
  Future<Article> getArticle(String id);

  Map<RoadmapLanguage, List<RoadmapType>> getRoadmapMap();
  Future<bool> getRoadmapExists(String id);
}

class LocalRoadmapDatasourceImpl implements LocalRoadmapDatasource {
  LocalRoadmapDatasourceImpl(Object object);

  @override
  Map<RoadmapLanguage, List<RoadmapType>> getRoadmapMap() {
    //TODO: Implement using json parsing
    return kAvailableRoadmaps;
  }

  @override
  Future<bool> getRoadmapExists(String id) async {
    String path = 'assest/json/$id.json';
    File file = File(path);

    return await file.exists();
  }

  @override
  Future<Roadmap> getRoadmap(String id) async {
    // Use ID for roadmap json file path
    String path = 'assets/json/$id.json';
    File file = File(path);

    String roadmapJson = await file.readAsString();
    RoadmapModel roadmap = RoadmapModel.fromJson(jsonDecode(roadmapJson));

    return roadmap;
  }

  @override
  Future<Article> getArticle(String id) async {
    // Use ID for article json file path
    String path = 'assets/json/$id.json';
    File file = File(path);

    if (!await file.exists()) {
      throw FileException();
    }

    String articleJson = await file.readAsString();
    ArticleModel article = ArticleModel.fromJson(jsonDecode(articleJson));

    return article;
  }
}
