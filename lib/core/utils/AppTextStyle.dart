import 'package:flutter/material.dart';

import 'package:booking_app_algoriza/core/utils/hex_color.dart';

/*extension ThemeValues on BuildContext {
  TextStyle? get headLine1 => Theme.of(this).textTheme.headline1;

  TextStyle? get headLine2 => Theme.of(this).textTheme.headline2;

  TextStyle? get headLine3 => Theme.of(this).textTheme.headline3;

  TextStyle? get headLine4 => Theme.of(this).textTheme.headline4;

  TextStyle? get headLine5 => Theme.of(this).textTheme.headline5;

  TextStyle? get headLine6 => Theme.of(this).textTheme.headline6;

  TextStyle? get bodyText1 => Theme.of(this).textTheme.bodyText1;

  TextStyle? get bodyText2 => Theme.of(this).textTheme.headline2;
}*/

class AppTextStyle {
  static const TextStyle largeTitle = TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35);
  static const TextStyle largeSubtitle = TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30);

  static const TextStyle normalTitle = TextStyle(
      color: Colors.white, fontWeight: FontWeight.normal, fontSize: 35);
  static const TextStyle normalSubtitle = TextStyle(
      color: Colors.white, fontWeight: FontWeight.normal, fontSize: 20);

  static const TextStyle buttonStyle = TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22);

  static const TextStyle smallTitle =
  TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);


  static const TextStyle showInMapsStyle = TextStyle(
      color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 16);

  static TextStyle descriptionStyle = TextStyle(
      color: HexColor('#8492A7'), fontWeight: FontWeight.normal, fontSize: 15);

  static TextStyle variantStyle = TextStyle(
      color: HexColor('#8492A7'), fontWeight: FontWeight.normal, fontSize: 20);
}
