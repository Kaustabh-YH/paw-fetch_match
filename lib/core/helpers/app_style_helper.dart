import 'package:flutter/material.dart';
import 'package:pawfetch_match/core/constants/app_colors.dart';

class AppStyle {

  // App Configuration Constants

  String appFontFamily = 'CircularStd';

  //Create Singleton

  static final shared = AppStyle();

  //Custom Font Styles

  /// This function is used to set the text style
  /// [size] - The font size
  /// [color] - The font color
  /// [weight] - The font weight
  /// [opacity] - The opacity of text color

  TextStyle customTextStyle({
    double size = 16,
    Color color = AppColors.fontSecondaryColor,
    FontWeight weight = FontWeight.w500,
    TextDecoration decoration = TextDecoration.none,
    double? opacity,
  }) {
    return TextStyle(
      fontFamily: appFontFamily,
      fontSize: size,
      fontWeight: weight,
      color: color.withValues(alpha:opacity ?? 1),
      decoration: decoration,
      decorationColor: color,
    );
  }

  /// This function is user to get the default font family

  String getDefaultFontFamily() => appFontFamily;
}