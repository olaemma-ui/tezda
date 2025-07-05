import 'package:flutter/material.dart';
import 'package:tezda/core/theme/color_manager.dart';
import 'package:tezda/core/utils/font_manager.dart';

abstract class AppTheme {
  static ThemeData get themeData => ThemeData(
        primaryColor: ColorManager.primary,
        primarySwatch: ColorManager.primarySwatch,
        scaffoldBackgroundColor: ColorManager.background,
        textTheme: _textTheme,
        textButtonTheme: _textButtonTheme,
        inputDecorationTheme: _inputDecorationTheme(),
        cardColor: ColorManager.black50,
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorManager.background,
          centerTitle: true,
          toolbarHeight: 40,
          scrolledUnderElevation: 0,
        ),
        datePickerTheme: DatePickerThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            fillColor: Colors.white,
            filled: true,
          ),
          dayOverlayColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.focused) ||
                  states.contains(WidgetState.selected) ||
                  states.contains(WidgetState.pressed)) {
                return ColorManager.primary;
              }
              // Default color when not focused, active, or clicked
              return Colors.transparent;
            },
          ),
          dayStyle: FontManager.getTextStyle(
            fontSize: 12,
          ),
          weekdayStyle: FontManager.getTextStyle(
            fontSize: 12,
            fontWeight: FontManager.bold,
          ),
          headerHelpStyle: FontManager.getTextStyle(
            fontSize: 12,
          ),
          yearStyle: FontManager.getTextStyle(
            fontSize: 12,
            fontWeight: FontManager.bold,
          ),
          dayBackgroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.focused) ||
                  states.contains(WidgetState.selected) ||
                  states.contains(WidgetState.pressed)) {
                return ColorManager.primary;
              }
              // Default color when not focused, active, or clicked
              return Colors.transparent;
            },
          ),
          todayBorder: const BorderSide(
            color: ColorManager.primary,
            width: 1,
          ),
          todayForegroundColor: const WidgetStatePropertyAll(
            ColorManager.primary,
          ),
          todayBackgroundColor: const WidgetStatePropertyAll(
            Colors.transparent,
          ),
          yearBackgroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.focused) ||
                  states.contains(WidgetState.selected) ||
                  states.contains(WidgetState.pressed)) {
                return ColorManager.primary;
              }
              // Default color when not focused, active, or clicked
              return Colors.transparent;
            },
          ),
          cancelButtonStyle: const ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(ColorManager.primary),
            minimumSize: WidgetStatePropertyAll(
              Size(80, 45),
            ),
            fixedSize: WidgetStatePropertyAll(Size(80, 40)),
            backgroundColor: WidgetStatePropertyAll(Colors.transparent),
          ),
          confirmButtonStyle: ButtonStyle(
            fixedSize: const WidgetStatePropertyAll(Size(150, 40)),
            minimumSize: const WidgetStatePropertyAll(
              Size(80, 45),
            ),
            iconColor: const WidgetStatePropertyAll(ColorManager.textWhite),
            foregroundColor:
                const WidgetStatePropertyAll(ColorManager.textWhite),
            textStyle: WidgetStatePropertyAll(
              FontManager.getTextStyle(
                color: ColorManager.textWhite,
              ),
            ),
          ),
        ),
      );

  // Application TextTheme
  static TextTheme get _textTheme {
    return TextTheme(
      labelSmall: FontManager.getTextStyle(
        fontSize: 12,
      ),
      labelMedium: FontManager.getTextStyle(
        fontSize: 14,
      ),
      labelLarge: FontManager.getTextStyle(
        fontSize: 16,
        fontWeight: FontManager.bold,
      ),
      bodySmall: FontManager.getTextStyle(
        fontSize: 16,
      ),
      bodyMedium: FontManager.getTextStyle(
        fontSize: 18,
      ),
      bodyLarge: FontManager.getTextStyle(
        fontSize: 20,
        fontWeight: FontManager.bold,
      ),
      titleSmall: FontManager.getTextStyle(
        fontSize: 20,
      ),
      titleMedium: FontManager.getTextStyle(
        fontSize: 22,
      ),
      titleLarge: FontManager.getTextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Application TextButtonTheme
  static TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        disabledBackgroundColor: ColorManager.primaryAcent.withOpacity(.2),
        backgroundColor: ColorManager.primary,
        minimumSize: const Size(1000, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: FontManager.getTextStyle(
          fontSize: 14,
          color: ColorManager.textWhite,
        ),
        overlayColor: ColorManager.background,
      ),
    );
  }

  // static Input field decorartor
  static InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      labelStyle: FontManager.getTextStyle(
        fontSize: 14,
        color: ColorManager.textHint,
      ),
      hintStyle: FontManager.getTextStyle(
        fontSize: 14,
        color: ColorManager.textHint,
      ),
      alignLabelWithHint: true,
      fillColor: ColorManager.grey,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      errorBorder: outlineInputBorder(color: ColorManager.error),
      border: outlineInputBorder(color: ColorManager.defaultBorder),
      enabledBorder: outlineInputBorder(color: ColorManager.defaultBorder),
      focusedBorder: outlineInputBorder(color: ColorManager.focusInputBorder),
      focusedErrorBorder: outlineInputBorder(color: ColorManager.error),
    );
  }

  static outlineInputBorder({required Color? color, double? radius}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 100),
        borderSide: BorderSide(
          color: color ?? ColorManager.defaultBorder,
          width: 1,
        ),
      );
}
