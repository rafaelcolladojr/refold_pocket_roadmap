import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/stage_details_entity.dart';

class Stage {
  Stage({
    required this.id,
    required this.subtitle,
    required this.headline,
    required this.intro,
    required this.details,
  });

  String id;
  String subtitle;
  String headline;
  String intro;
  StageDetails details;
}
