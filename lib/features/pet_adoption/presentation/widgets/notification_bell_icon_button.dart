import 'package:flutter/material.dart';
import 'package:pawfetch_match/core/constants/image_assets.dart';
import 'package:pawfetch_match/shared/widgets/custom_icon_button.dart';

class NotificationBellIconButton extends StatelessWidget {
  const NotificationBellIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Stack(
        children: [
          CustomIconButton(
            onPressed: () {},
            assetName: ImageAssets.bell,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 6),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
