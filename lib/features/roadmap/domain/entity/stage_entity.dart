import 'package:equatable/equatable.dart';
import 'package:refold_pocket_roadmap/features/roadmap/domain/entity/stage_details_entity.dart';

class Stage extends Equatable {
  const Stage({
    required this.id,
    required this.subtitle,
    required this.headline,
    required this.intro,
    required this.details,
  });

  final String id;
  final String subtitle;
  final String headline;
  final String intro;
  final StageDetails details;

  @override
  List<Object?> get props => [id, subtitle, headline, intro, details];
}
