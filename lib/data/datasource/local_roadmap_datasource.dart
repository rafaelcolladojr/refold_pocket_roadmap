import 'dart:convert';
import 'dart:io';

import 'package:refold_pocket_roadmap/data/model/article_model.dart';
import 'package:refold_pocket_roadmap/data/model/roadmap_model.dart';

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
    Roadmap roadmap = Roadmap.fromJson(jsonDecode(roadmapJson));

    return roadmap;
  }

  @override
  Future<Article> getArticle(String id) async {
    // Use ID for article json file path
    String path = 'assets/json/$id.json';
    File file = File(path);

    String articleJson = await file.readAsString();
    Article article = Article.fromJson(jsonDecode(articleJson));

    return article;
  }
}
