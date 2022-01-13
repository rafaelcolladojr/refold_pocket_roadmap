import 'package:refold_pocket_roadmap/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:refold_pocket_roadmap/domain/entity/roadmap_entity.dart';
import 'package:refold_pocket_roadmap/domain/usecase/usecase.dart';

class GetRoadmapParams {
  final String type;
  final String lang;

  GetRoadmapParams({required this.type, required this.lang});
}

class GetRoadmap implements UseCase<Roadmap, GetRoadmapParams> {
  @override
  Future<Either<Failure, Roadmap>> call(GetRoadmapParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
