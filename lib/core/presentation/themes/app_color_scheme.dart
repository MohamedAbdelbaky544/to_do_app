import 'package:flutter/material.dart';

abstract class AppColorScheme {
  Brightness get brightness;
  Color get primaryColor => const Color(0xffABADB1);

  Color get lightColor => const Color(0xffABADB1);

  Color get whiteColor => Colors.white;

  Color get whiteBorderColor => const Color(0xffE8EBF3);

  Color get shadowColor => const Color(0xffD4D4D4);

  Color get shadowSettingColor => const Color(0xff585757);

  Color get dialogBackgroundColor => const Color(0xffF3F4F5);

  Color get blackColor => const Color(0xff000000);

  Color get blackTitleColor => const Color(0xff121212);

  Color get darkGreyColor => const Color(0xff626262);

  Color get greyColor => const Color(0xffDFD5EC);

  Color get grey => const Color(0xffbdbdbd);

  Color get greyColorForBorder => const Color(0xffEEEFEF);

  Color get backgroundColor => const Color(0xffF5F5F5);

  Color get errorColor => const Color(0xffB3261E);

  Color get successColor => const Color(0xff2E7D32);
}

class AppLightColors extends AppColorScheme {
  @override
  Brightness get brightness => Brightness.light;
}
