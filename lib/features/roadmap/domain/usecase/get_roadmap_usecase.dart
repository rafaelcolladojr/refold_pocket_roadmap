import 'package:refold_pocket_roadmap/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:refold_pocket_roadmap/core/params/get_roadmap_params.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/roadmap_entity.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/repository/roadmap_repository.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/usecase/usecase.dart';

class GetRoadmapUsecase implements UseCase<Roadmap, GetRoadmapParams> {
  GetRoadmapUsecase(RoadmapRepository repository) : _repository = repository;

  final RoadmapRepository _repository;

  @override
  Future<Either<Failure, Roadmap>> call(GetRoadmapParams params) async {
    return await _repository.getRoadmap(params);
  }
}
