import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();
}

class ServerFailure implements Failure {
  @override
  List<Object?> get props => [props];

  @override
  bool? get stringify => true;
}

class CacheFailure implements Failure {
  @override
  List<Object?> get props => [props];

  @override
  bool? get stringify => true;
}
