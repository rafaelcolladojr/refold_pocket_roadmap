import 'package:dartz/dartz.dart';
import 'package:refold_pocket_roadmap/core/error/failure.dart';
import 'package:refold_pocket_roadmap/core/params/get_roadmap_params.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/article_entity.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/roadmap_entity.dart';

abstract class RoadmapRepository {
  Future<Either<Failure, Roadmap>> getRoadmap(GetRoadmapParams params);
  Future<Either<Failure, Article>> getArticle(String id);
}
