import 'package:refold_pocket_roadmap/data/model/article_details_model.dart';
import 'package:refold_pocket_roadmap/domain/entity/stage_details_entity.dart';
import 'package:refold_pocket_roadmap/domain/entity/stage_entity.dart';

import 'stage_details_model.dart';

class StageModel extends Stage {
  StageModel({
    required String id,
    required String subtitle,
    required String headline,
    required String intro,
    required StageDetailsModel details,
  }) : super(
            id: id,
            subtitle: subtitle,
            headline: headline,
            intro: intro,
            details: details);

  factory StageModel.fromJson(Map<String, dynamic> json) => StageModel(
        id: json["id"],
        subtitle: json["subtitle"],
        headline: json["headline"],
        intro: json["intro"],
        details: StageDetailsModel.fromJson(json["details"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subtitle": subtitle,
        "headline": headline,
        "intro": intro,
        "details": (details as StageDetailsModel).toJson(),
      };

  @override
  String toString() {
    return '$subtitle: $headline\n$intro\n$details';
  }
}
