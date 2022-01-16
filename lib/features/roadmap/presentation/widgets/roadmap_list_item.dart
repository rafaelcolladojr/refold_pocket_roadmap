import 'package:flutter/material.dart';
import 'package:refold_pocket_roadmap/core/util/app_colors.dart';
import 'package:refold_pocket_roadmap/core/util/app_text_styles.dart';

class RoadmapListItem extends StatelessWidget {
  const RoadmapListItem({
    Key? key,
    required this.title,
    this.backgroundImage,
    this.onTap,
  }) : super(key: key);

  final String title;
  final ImageProvider? backgroundImage;
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
          color: kBackgroundColor,
          child: AspectRatio(
            aspectRatio: 6 / 3,
            child: ClipRRect(
              child: Stack(
                children: [
                  PositionedDirectional(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Center(
                        child: Text(
                          title,
                          style: kTitle2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20.0,
                    right: 20.0,
                    height: 30.0,
                    child: Opacity(
                      opacity: 0.7,
                      child: Image(
                        image: backgroundImage ??
                            const AssetImage('assets/images/logo-primary.png'),
                      ),
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
