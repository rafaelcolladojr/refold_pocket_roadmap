import 'package:flutter/material.dart';
import 'package:refold_pocket_roadmap/core/util/common/app_colors.dart';
import 'package:refold_pocket_roadmap/core/util/common/app_text_styles.dart';

class StageListItem extends StatelessWidget {
  const StageListItem({
    Key? key,
    required this.marker,
    required this.title,
    this.subtitle = '',
    this.color = kPrimaryColor,
    this.onTap,
  }) : super(key: key);

  final String marker;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 26.0, left: 26, right: 26),
        child: Material(
          borderRadius: BorderRadius.circular(30.0),
          elevation: 8.0,
          color: color,
          child: AspectRatio(
            aspectRatio: 5 / 3,
            child: Container(
              padding: const EdgeInsets.all(26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(marker, style: kTitle4.withColor(kForegroundColor)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(title, style: kTitle2.withColor(kBackgroundColor)),
                  ),
                  Expanded(
                    child: Text(
                      subtitle,
                      style: kParagraph.withColor(kForegroundColor),
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
