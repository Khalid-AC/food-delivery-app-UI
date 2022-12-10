import 'package:flutter/material.dart';
import 'package:food_delivery_ui/presentation/resources/colorsManager.dart';
import 'package:food_delivery_ui/presentation/resources/font_manager.dart';
import 'package:food_delivery_ui/presentation/resources/styles_manager.dart';
import 'package:food_delivery_ui/presentation/resources/values_manager.dart';

class ThemeManager {
  //
  static ThemeData getApplicationTheme() {
    return ThemeData(
      //
      primaryColor: ColorsManager.primaryColor,

      //
      textTheme: TextTheme(
          //
          headlineLarge: getBoldStyle(
              fontSize: FontSizeManager.s20, color: ColorsManager.black1),

          //
          headlineMedium: getMediumStyle(
              fontSize: FontSizeManager.s14, color: ColorsManager.black1),

          //
          titleLarge: getBoldStyle(
              fontSize: FontSizeManager.s22, color: ColorsManager.black1),

          //
          titleMedium: getSemiBoldStyle(
              fontSize: FontSizeManager.s16, color: ColorsManager.white),

          //
          titleSmall: getRegularStyle(
              fontSize: FontSizeManager.s12, color: ColorsManager.black),

          //
          labelMedium: getRegularStyle(
              fontSize: FontSizeManager.s14, color: ColorsManager.grey1),

          //
          bodyLarge: getMediumStyle(
              fontSize: FontSizeManager.s14, color: ColorsManager.primaryColor),

          //
          bodyMedium: getRegularStyle(
              fontSize: FontSizeManager.s12, color: ColorsManager.grey1)),

      //

      //

      //
      inputDecorationTheme: InputDecorationTheme(
        //
        prefixIconColor: ColorsManager.primaryColor,

        //
        contentPadding: const EdgeInsets.all(PaddingManager.p20),

        //

        hintStyle: getRegularStyle(
            fontSize: FontSizeManager.s14, color: ColorsManager.grey1),

        //
        labelStyle: getRegularStyle(
            fontSize: FontSizeManager.s14, color: ColorsManager.grey1),

        //
        errorStyle: getRegularStyle(
            fontSize: FontSizeManager.s14, color: ColorsManager.errorColor),

        //
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(ValuesManager.v15),
          ),
          borderSide: BorderSide(
              color: ColorsManager.white, width: ValuesManager.v0_25),
        ),

        //
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(ValuesManager.v15),
          ),
          borderSide: BorderSide(
              color: ColorsManager.white, width: ValuesManager.v0_25),
        ),

        //
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(ValuesManager.v15),
          ),
          borderSide: BorderSide(
              color: ColorsManager.errorColor, width: ValuesManager.v0_25),
        ),

        //
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(ValuesManager.v15),
          ),
          borderSide: BorderSide(
              color: ColorsManager.orange1, width: ValuesManager.v0_25),
        ),
      ),
    );
  }
}
