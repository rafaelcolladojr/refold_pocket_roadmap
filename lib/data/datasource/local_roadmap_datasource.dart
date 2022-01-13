import 'dart:convert';
import 'dart:io';

import 'package:refold_pocket_roadmap/core/error/exception.dart';
import 'package:refold_pocket_roadmap/data/model/article_model.dart';
import 'package:refold_pocket_roadmap/data/model/roadmap_model.dart';
import 'package:refold_pocket_roadmap/domain/entity/article_entity.dart';
import 'package:refold_pocket_roadmap/domain/entity/roadmap_entity.dart';

abstract class LocalRoadmapDatasource {
  Future<Roadmap> getRoadmap(String id);
  Future<Article> getArticle(String id);
}

class LocalRoadmapDatasourceImpl implements LocalRoadmapDatasource {
  LocalRoadmapDatasourceImpl();

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
