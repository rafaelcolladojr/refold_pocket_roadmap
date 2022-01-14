import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/stage_entity.dart';

class Roadmap {
  Roadmap({
    required this.type,
    required this.lang,
    required this.stages,
  });

  String type;
  String lang;
  List<Stage> stages;
}
