import 'package:flutter/material.dart';
import 'package:pawfetch_match/core/constants/app_colors.dart';
import 'package:pawfetch_match/core/helpers/app_style_helper.dart';

class ListHeaderTile extends StatelessWidget {
  //Tile Variables

  final String primaryTitle;
  final String secondaryTitle;

  //Constructor

  const ListHeaderTile({
    super.key,
    required this.primaryTitle,
    required this.secondaryTitle,
  });

  //Build Widget

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            primaryTitle,
            style: AppStyle.shared
                .customTextStyle(size: 20, color: AppColors.fontPrimaryColor),
          ),
          Text(
            secondaryTitle,
            style: AppStyle.shared
                .customTextStyle(size: 16, color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
