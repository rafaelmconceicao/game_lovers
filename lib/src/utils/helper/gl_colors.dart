import 'package:flutter/material.dart';

class GLColors {
  static MaterialColor materialThemePrimarySwatch = MaterialColor(
    primary.value,
    {
      50:  primary.withOpacity(.1),
      100: primary.withOpacity(.2),
      200: primary.withOpacity(.3),
      300: primary.withOpacity(.4),
      400: primary.withOpacity(.5),
      500: primary.withOpacity(.6),
      600: primary.withOpacity(.7),
      700: primary.withOpacity(.8),
      800: primary.withOpacity(.9),
      900: primary.withOpacity(1),
    },
  );
  static const primary = Color(0XFF1A8522);
  static const royalGreen = Color(0XFF135f18);
  static const quickSilver = Color(0XFFA4A4A4);
  static const brightGray = Color(0XFFEBEBEB);
  static const darkGray = Color(0XFFAAAAAA);
  static const white = Colors.white;
  static const black = Colors.black;
}
