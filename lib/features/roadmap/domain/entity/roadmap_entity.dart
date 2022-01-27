import 'package:equatable/equatable.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/stage_entity.dart';

class Roadmap extends Equatable {
  const Roadmap({
    required this.type,
    required this.lang,
    required this.stages,
  });

  Roadmap get empty {
    return const Roadmap(type: '', lang: '', stages: []);
  }

  final String type;
  final String lang;
  final List<Stage> stages;

  @override
  List<Object?> get props => [type, lang, stages];
}
