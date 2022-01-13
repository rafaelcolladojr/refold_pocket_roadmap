import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();
}

class FileFailure implements Failure {
  @override
  List<Object?> get props => [props];

  @override
  bool? get stringify => true;
}
