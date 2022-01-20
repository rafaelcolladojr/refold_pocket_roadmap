import 'package:refold_pocket_roadmap/core/error/exception.dart';
import 'package:refold_pocket_roadmap/core/params/get_roadmap_params.dart';
import 'package:refold_pocket_roadmap/features/roadmap/data/datasource/local_roadmap_datasource.dart';
import 'package:refold_pocket_roadmap/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/article_entity.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/roadmap_entity.dart';

abstract class RoadmapRepository {
  Future<Either<Failure, Roadmap>> getRoadmap(GetRoadmapParams params);
  Future<Either<Failure, Article>> getArticle(String id);
}

class RoadmapRepositoryImpl implements RoadmapRepository {
  RoadmapRepositoryImpl({
    required this.localRoadmapDatasource,
  });
  final LocalRoadmapDatasource localRoadmapDatasource;
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
