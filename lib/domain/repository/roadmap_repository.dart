import 'package:dartz/dartz.dart';
import 'package:refold_pocket_roadmap/core/error/failure.dart';
import 'package:refold_pocket_roadmap/data/model/roadmap_model.dart';

abstract class RoadmapRepository {
  Future<Either<Failure, Roadmap>> getRoadmap(String id);
}
