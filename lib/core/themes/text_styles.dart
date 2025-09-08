import 'package:flutter/cupertino.dart';

import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';

class TextStyles {

  static TextStyle get title => TextStyle(
    fontFamily: FontFamily.tenorSans,
    color: ColorName.blackColor,
    fontSize: 22,
    letterSpacing: 3
  );

   static TextStyle get subTitle => TextStyle(
    fontFamily: FontFamily.tenorSans,
    color: ColorName.grayColor,
    fontSize: 20,
    letterSpacing: 2
  );

  static TextStyle get productInfo => TextStyle(
    fontFamily: FontFamily.tenorSans,
    color: ColorName.blackColor,
    fontSize: 16,
      letterSpacing: 2

  );
  static TextStyle get coverInfo => TextStyle(
    fontFamily: FontFamily.tenorSans,
    color: ColorName.whiteColor,
    fontSize: 20,
  );
  static TextStyle get footerStyle => TextStyle(
    fontFamily: FontFamily.tenorSans,
    color: ColorName.whiteColor,
    fontSize: 15,
  );
}
