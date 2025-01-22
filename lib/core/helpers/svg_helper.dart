import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// This class has a single responsibility to load SVG image only

class SVGHelper {

  /// This function is used to load the SVG image through out the app

  static Widget loadImage({
    required String assetName,
    double? width,
    double? height,
    Color? color,
    BoxFit fit = BoxFit.contain,
  }) {
    return SvgPicture.asset(
      assetName,
      width: width,
      height: height,
      colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      fit: fit,
    );
  }
}
