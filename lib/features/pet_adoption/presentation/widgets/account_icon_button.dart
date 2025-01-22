import 'package:flutter/material.dart';
import 'package:pawfetch_match/core/constants/image_assets.dart';

class AccountIconButton extends StatelessWidget {

  // Data Types

  final void Function() callback;

  // Constructor

  const AccountIconButton({super.key, required this.callback,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, right: 16),
      child: InkWell(
        onTap: () {
          callback.call();
        },
        child: CircleAvatar(
          radius: 20,
          child: Image.network(ImageAssets.dummyProfileImgUrl,),
        ),
      ),
    );
  }
}
