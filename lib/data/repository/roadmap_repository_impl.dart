import 'package:refold_pocket_roadmap/core/error/exception.dart';
import 'package:refold_pocket_roadmap/data/datasource/local_roadmap_datasource.dart';
import 'package:refold_pocket_roadmap/data/model/roadmap_model.dart';
import 'package:refold_pocket_roadmap/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:refold_pocket_roadmap/domain/repository/roadmap_repository.dart';

class RoadmapRepositoryImpl implements RoadmapRepository {
  RoadmapRepositoryImpl({
    required this.localRoadmapDatasource,
  });
  final LocalRoadmapDatasource localRoadmapDatasource;
  @override
  Future<Either<Failure, Roadmap>> getRoadmap(String id) async {
    // Currently only using prepackaged json files
    try {
      Roadmap roadmap = await localRoadmapDatasource.getRoadmap(id);
      return Right(roadmap);
    } on FileException {
      return Left(FileFailure());
    }
  }
}
