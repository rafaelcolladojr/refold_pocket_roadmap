import 'package:flutter/material.dart';
import 'package:refold_pocket_roadmap/common/app_colors.dart';
import 'package:refold_pocket_roadmap/common/app_text_styles.dart';

class StageListItem extends StatelessWidget {
  StageListItem({
    Key? key,
    required this.marker,
    required this.title,
    String? subtitle,
  }) : super(key: key) {
    this.subtitle = subtitle ?? '';
  }

  final String marker;
  final String title;
  late String subtitle;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      color: kPrimaryColor,
      child: AspectRatio(
        aspectRatio: 5 / 3,
        child: Container(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(marker, style: kTitle4.withColor(kForegroundColor)),
              Text(title, style: kTitle2.withColor(kBackgroundColor)),
              Text(subtitle, style: kParagraph.withColor(kForegroundColor)),
            ],
          ),
        ),
      ),
    );
  }
}
