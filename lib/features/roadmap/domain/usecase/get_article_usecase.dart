import 'package:refold_pocket_roadmap/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/article_entity.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/repository/roadmap_repository.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/usecase/usecase.dart';

class GetArticleUsecase implements UseCase<Article, String> {
  GetArticleUsecase(RoadmapRepository roadmapRepository)
      : _roadmapRepository = roadmapRepository;
  final RoadmapRepository _roadmapRepository;

  @override
  Future<Either<Failure, Article>> call(String id) async {
    return await _roadmapRepository.getArticle(id);
  }
}
