import 'package:refold_pocket_roadmap/core/error/exception.dart';
import 'package:refold_pocket_roadmap/core/params/get_roadmap_params.dart';
import 'package:refold_pocket_roadmap/core/util/roadmap_language.dart';
import 'package:refold_pocket_roadmap/core/util/roadmap_type.dart';
import 'package:refold_pocket_roadmap/features/roadmap/data/datasource/local_roadmap_datasource.dart';
import 'package:refold_pocket_roadmap/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/article_entity.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/roadmap_entity.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/roadmap_thumbnail_entity.dart';

abstract class RoadmapRepository {
  Future<Either<Failure, Roadmap>> getRoadmap(GetRoadmapParams params);
  Future<Either<Failure, Article>> getArticle(String id);

  Future<Either<Failure, Map<RoadmapLanguage, List<RoadmapThumbnail>>>>
      getRoadmapThumbnails();
}

class RoadmapRepositoryImpl implements RoadmapRepository {
  RoadmapRepositoryImpl({
    required this.localRoadmapDatasource,
  });
  final LocalRoadmapDatasource localRoadmapDatasource;

  @override
  Future<Either<Failure, Map<RoadmapLanguage, List<RoadmapThumbnail>>>>
      getRoadmapThumbnails() async {
    Map<RoadmapLanguage, List<RoadmapType>> roadmaps =
        localRoadmapDatasource.getRoadmapMap();

    Map<RoadmapLanguage, List<RoadmapThumbnail>> thumbnails = {};
    for (RoadmapLanguage lang in thumbnails.keys) {
      thumbnails[lang] = [];
    }

    try {
      roadmaps.forEach((lang, types) async {
        for (var type in types) {
          String id = '${lang != RoadmapLanguage.en ? "{$lang}_" : ""}$type';
          bool exists = await localRoadmapDatasource.getRoadmapExists(id);
          thumbnails[lang]!
              .add(RoadmapThumbnail(lang: lang, type: type, enabled: exists));
        }
      });
      return Right(thumbnails);
    } on FileException {
      return Left(FileFailure());
    }
  }

  @override
  Future<Either<Failure, Roadmap>> getRoadmap(GetRoadmapParams params) async {
    // Currently only using prepackaged json files

    String id = params.type + '_' + params.lang;
    try {
      Roadmap roadmap = await localRoadmapDatasource.getRoadmap(id);
      return Right(roadmap);
    } on FileException {
      return Left(FileFailure());
    }
  }

  @override
  Future<Either<Failure, Article>> getArticle(String id) async {
    try {
      Article article = await localRoadmapDatasource.getArticle(id);
      return Right(article);
    } on FileException {
      return Left(FileFailure());
    }
  }
}
