import 'package:flutter/material.dart';
import 'package:pawfetch_match/core/constants/app_colors.dart';
import 'package:pawfetch_match/core/helpers/app_style_helper.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  //CustomAppBar variables

  final Widget leading;
  final List<Widget> actions;
  final String? title;

  //Constructor

  const CustomAppBar({
    super.key,
    required this.leading,
    this.actions = const [],
    this.title,
  });

  //Build Widget

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      shadowColor: Theme.of(context).shadowColor,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,
      elevation:0,
      scrolledUnderElevation: 1,
      title: title != null  ? Text(title ?? '', style: AppStyle.shared.customTextStyle(color: AppColors.fontPrimaryColor),): null,
      leading: leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
