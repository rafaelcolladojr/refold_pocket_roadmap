import 'package:flutter/material.dart';
import 'package:refold_pocket_roadmap/core/util/common/app_colors.dart';
import 'package:refold_pocket_roadmap/core/util/common/app_text_styles.dart';

class ArticleListItem extends StatelessWidget {
  const ArticleListItem({
    Key? key,
    required this.code,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final String code;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    String _code = code;
    String _title = title;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: GestureDetector(
          onTap: onTap,
          child: Material(
            borderRadius: BorderRadius.circular(10.0),
            elevation: 8.0,
            color: kPrimaryColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _code,
                    style: kArticleThumbnailId,
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    _title.trim(),
                    style: kArticleThumbnailTitle,
                    overflow: TextOverflow.clip,
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
