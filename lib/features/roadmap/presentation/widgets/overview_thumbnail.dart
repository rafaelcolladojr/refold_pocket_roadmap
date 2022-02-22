import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:refold_pocket_roadmap/core/util/common/app_colors.dart';
import 'package:refold_pocket_roadmap/core/util/common/app_text_styles.dart';

class OverviewThumbnail extends StatelessWidget {
  const OverviewThumbnail({
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
        aspectRatio: 2 / 1,
        child: GestureDetector(
          onTap: onTap,
          child: Material(
            borderRadius: BorderRadius.circular(20.0),
            elevation: 8.0,
            color: kPrimaryColorDark,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: double.infinity,
                      child: AutoSizeText(
                        _title.trim(),
                        style: kOverviewThumbnailTitle,
                        textAlign: TextAlign.start,
                        maxLines: 2,
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        _code,
                        style: kOverviewThumbnailId,
                        textAlign: TextAlign.right,
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
