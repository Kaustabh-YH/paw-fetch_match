import 'package:flutter/material.dart';
import 'package:pawfetch_match/core/constants/image_assets.dart';
import 'package:pawfetch_match/features/pet_adoption/presentation/widgets/account_icon_button.dart';
import 'package:pawfetch_match/features/pet_adoption/presentation/widgets/notification_bell_icon_button.dart';
import 'package:pawfetch_match/shared/widgets/custom_app_bar.dart';
import 'package:pawfetch_match/shared/widgets/custom_icon_button.dart';

class PetAdoptionAppBar extends StatelessWidget implements PreferredSizeWidget {
  //Data Types

  final void Function() callback;

  //Constructor

  const PetAdoptionAppBar({
    super.key,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      leading: CustomIconButton(
        onPressed: () {},
        assetName: ImageAssets.menu,
      ),
      actions: [
        NotificationBellIconButton(),
        AccountIconButton(callback: () {
          callback.call();
        },),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
