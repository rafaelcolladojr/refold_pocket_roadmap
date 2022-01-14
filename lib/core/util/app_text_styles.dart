import 'package:flutter/material.dart';
import 'package:refold_pocket_roadmap/core/util/app_colors.dart';

extension TextStyleColorX on TextStyle {
  TextStyle withColor(Color color) {
    return copyWith(color: color);
  }
}

const TextStyle kTitle1 = TextStyle(
  fontFamily: "Montserrat",
  color: kPrimaryColor,
  fontWeight: FontWeight.w700,
  fontSize: 32.0,
);

const TextStyle kTitle2 = TextStyle(
  fontFamily: "Montserrat",
  color: kPrimaryColor,
  fontWeight: FontWeight.w700,
  fontSize: 30.0,
);

const TextStyle kTitle3 = TextStyle(
  fontFamily: "Montserrat",
  color: kPrimaryColor,
  fontWeight: FontWeight.w700,
  fontSize: 24.0,
);

const TextStyle kTitle4 = TextStyle(
  fontFamily: "Montserrat",
  color: kPrimaryColor,
  fontWeight: FontWeight.w700,
  fontSize: 16.0,
);

const TextStyle kParagraph = TextStyle(
  fontFamily: "Montserrat",
  color: kPrimaryColor,
  fontSize: 14.0,
);
