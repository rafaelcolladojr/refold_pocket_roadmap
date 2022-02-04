import 'package:flutter/material.dart';
import 'package:refold_pocket_roadmap/core/util/common/app_colors.dart';

extension TextStyleColorX on TextStyle {
  TextStyle withColor(Color color) {
    return copyWith(color: color);
  }
}

const TextStyle kTitle1 = TextStyle(
  fontFamily: "Montserrat",
  color: kPrimaryColor,
  fontWeight: FontWeight.w700,
  fontSize: 30.0,
);

const TextStyle kTitle2 = TextStyle(
  fontFamily: "Montserrat",
  color: kPrimaryColor,
  fontWeight: FontWeight.w700,
  fontSize: 24.0,
);

const TextStyle kTitle3 = TextStyle(
  fontFamily: "Montserrat",
  color: kPrimaryColor,
  fontWeight: FontWeight.w700,
  fontSize: 20.0,
);

const TextStyle kTitle4 = TextStyle(
  fontFamily: "Montserrat",
  color: kPrimaryColor,
  fontWeight: FontWeight.w700,
  fontSize: 16.0,
);

const TextStyle kTitle6 = TextStyle(
  fontFamily: "Montserrat",
  color: kPrimaryColor,
  fontWeight: FontWeight.w700,
  fontSize: 14.0,
);

const TextStyle kParagraph = TextStyle(
  fontFamily: "Open Sans",
  color: kPrimaryColor,
  fontSize: 15.0,
);

const TextStyle kArticleThumbnailId = TextStyle(
  color: Colors.black,
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Montserrat',
);

const TextStyle kArticleThumbnailTitle = TextStyle(
  color: Colors.white,
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Montserrat',
);

const TextStyle kArticleFootnote = TextStyle(
  fontFamily: "Open Sans",
  color: kPrimaryColor,
  fontSize: 15.0,
  decoration: TextDecoration.none,
);
