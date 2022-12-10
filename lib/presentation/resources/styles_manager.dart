import 'package:flutter/material.dart';
import 'package:food_delivery_ui/presentation/resources/font_manager.dart';

//
TextStyle _getTextStyle(
    {required double fontSize, required FontWeight fontWeigth, required Color color}) {
  return TextStyle(
      fontFamily: FontsConstants.sourceSansProFontFamily,

      //
      
      fontSize: fontSize,
      fontWeight: fontWeigth,
      color: color);
}

//
TextStyle getLightStyle({required double fontSize , required Color color}) {
  return _getTextStyle(
      fontSize: fontSize, fontWeigth: FontWeigthManager.light, color: color );
}

//
TextStyle getRegularStyle({required double fontSize , required Color color}) {
  return _getTextStyle(
      fontSize: fontSize, fontWeigth: FontWeigthManager.regular, color: color );
}

//
TextStyle getMediumStyle({required double fontSize , required Color color}) {
  return _getTextStyle(
      fontSize: fontSize, fontWeigth: FontWeigthManager.medium, color: color );
}

//
TextStyle getSemiBoldStyle({required double fontSize , required Color color}) {
  return _getTextStyle(
      fontSize: fontSize, fontWeigth: FontWeigthManager.semiBold, color: color );
}

//
TextStyle getBoldStyle({required double fontSize , required Color color}) {
  return _getTextStyle(
      fontSize: fontSize, fontWeigth: FontWeigthManager.bold, color: color );
}

