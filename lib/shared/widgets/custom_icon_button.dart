import 'package:flutter/material.dart';
import 'package:pawfetch_match/core/helpers/svg_helper.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String assetName;
  final double width;
  final double height;
  final Color? color;

  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.assetName,
    this.width = 24,
    this.height = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      style: const ButtonStyle(splashFactory: NoSplash.splashFactory),
      icon: SVGHelper.loadImage(
        assetName: assetName,
        width: width,
        height: height,
        color: color,
      ),
    );
  }
}
