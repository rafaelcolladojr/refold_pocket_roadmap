import 'package:dartz/dartz.dart';
import 'package:refold_pocket_roadmap/core/error/failure.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call(P params);
}
