import 'package:flutter/material.dart';
import 'package:frontend_vendor/constants/constants.dart';
import 'package:frontend_vendor/extension/build_context_extension.dart';

class AppThemes {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    dividerColor: const Color(0xFFE8E8EA),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            fontFamily: "Poppins",
            color: Color(0xFF191825),
            height: 1.2,
          ),
          
           titleSmall: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            fontFamily: "Poppins",
            color: Color(0xFF191825),
            height: 1.2,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily: "Poppins",
            color: Color(0xFF191825),
            height: 1.2,
          ),
          displayMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: "SF Pro Display",
            color: Color(0xFF191825),
            height: 1.2,
          ),
          displayLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            fontFamily: "SF Pro Display",
            color: Color(0xFF191825),
            height: 1.2,
          ),
          labelSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins",
            color: Color(0xFF191825),
            height: 1.2,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          labelStyle:
              context.titleMedium!.copyWith(color: const Color(0xFF53525C)),
          hintStyle:
              context.titleMedium!.copyWith(color: const Color(0xFF53525C)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color(0xFFC5C5C8),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: context.labelSmall!.copyWith(color: Colors.white),
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: const Color(0xFF0B1875),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      );
}



