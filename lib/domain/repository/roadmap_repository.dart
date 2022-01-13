import 'package:dartz/dartz.dart';
import 'package:refold_pocket_roadmap/core/error/failure.dart';
import 'package:refold_pocket_roadmap/domain/entity/roadmap_entity.dart';

abstract class RoadmapRepository {
  Future<Either<Failure, Roadmap>> getRoadmap(String id);
}
