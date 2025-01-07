import 'package:flutter/material.dart';
import 'package:to_do_app/core/presentation/themes/app_color_scheme.dart';

class AppTheme {
  final AppColorScheme _appColorScheme;
  AppTheme(this._appColorScheme);
  AppColorScheme get appColorScheme => _appColorScheme;
  ThemeData getThemeData(
    BuildContext context,
  ) {
    return ThemeData(
      primaryColor: _appColorScheme.primaryColor,
      colorScheme: ColorScheme(
        brightness: _appColorScheme.brightness,
        primary: _appColorScheme.primaryColor,
        onPrimary: _appColorScheme.whiteColor,
        secondary: _appColorScheme.darkGreyColor,
        onSecondary: _appColorScheme.blackColor,
        error: _appColorScheme.errorColor,
        onError: _appColorScheme.errorColor,
        surface: _appColorScheme.greyColorForBorder,
        onSurface: _appColorScheme.greyColor,
      ),
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: _appColorScheme.whiteColor,
      textTheme: const TextTheme(
        labelLarge: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 22,
        ),
        labelMedium: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        labelSmall: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        titleLarge: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 22,
        ),
        titleMedium: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        titleSmall: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        bodyLarge: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ).apply(
        bodyColor: _appColorScheme.blackColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          overlayColor:
              WidgetStateProperty.all(_appColorScheme.blackColor.withAlpha(50)),
          foregroundColor: WidgetStateProperty.all(_appColorScheme.whiteColor),
          elevation: WidgetStateProperty.all(0),
          backgroundColor: WidgetStateProperty.all<Color>(
            _appColorScheme.primaryColor,
          ),
          padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(vertical: 16, horizontal: 12)),
          minimumSize: WidgetStateProperty.all(const Size(32, 32)),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
          textStyle: WidgetStateProperty.all(TextStyle(
            color: _appColorScheme.whiteColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          )),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: WidgetStateProperty.all<Color?>(_appColorScheme.whiteColor),
        side: BorderSide(
          color: _appColorScheme.greyColor,
          width: 1.5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        fillColor: WidgetStateProperty.all<Color?>(_appColorScheme.whiteColor),
        materialTapTargetSize: MaterialTapTargetSize.padded,
      ),
      dividerTheme: DividerThemeData(
        color: _appColorScheme.greyColorForBorder,
        endIndent: 16,
        indent: 16,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          side: WidgetStateProperty.all<BorderSide>(
            BorderSide(
              color: _appColorScheme.primaryColor,
            ),
          ),
          padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(vertical: 16, horizontal: 12)),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: _appColorScheme.greyColorForBorder,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
        labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w400,
              color: _appColorScheme.darkGreyColor,
            ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: _appColorScheme.greyColor,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _appColorScheme.primaryColor,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _appColorScheme.errorColor,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _appColorScheme.greyColor,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _appColorScheme.errorColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: _appColorScheme.whiteColor,
        surfaceTintColor: _appColorScheme.whiteColor,
        titleTextStyle: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: _appColorScheme.blackTitleColor),
        contentTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: _appColorScheme.grey,
            ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
      ),
      tooltipTheme: TooltipThemeData(
        triggerMode: TooltipTriggerMode.tap,
        textStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: _appColorScheme.whiteColor),
        waitDuration: const Duration(seconds: 2),
        decoration: BoxDecoration(
          color: _appColorScheme.primaryColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

extension GetAppColorTheme on ThemeData {
  AppTheme appTheme([Brightness? brightness]) {
    late AppColorScheme appColorScheme;
    if ((brightness ?? this.brightness) == Brightness.light) {
      appColorScheme = AppLightColors();
    } else {
      /// Add dark theme here
    }
    return AppTheme(appColorScheme);
  }

  Theme datePickerDialogTheme(BuildContext context, Widget? widget) => Theme(
        data: Theme.of(context).copyWith(
          appBarTheme: AppBarTheme(
              backgroundColor: Theme.of(context).colorScheme.primary),
          dividerColor: Colors.grey,
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: Theme.of(context).colorScheme.primary,
                onPrimary: Theme.of(context).appColors.whiteColor,
                onSurface: Theme.of(context).textTheme.bodyLarge!.color,
              ),
        ),
        child: widget!,
      );

  AppColorScheme get appColors {
    return appTheme().appColorScheme;
  }

  Color customColorMode({
    required Color inDarkMode,
    required Color inLightMode,
  }) =>
      brightness == Brightness.light ? inLightMode : inDarkMode;
}
