import 'package:flutter/material.dart';
import 'package:pawfetch_match/core/constants/app_colors.dart';
import 'package:pawfetch_match/core/helpers/app_style_helper.dart';

class PetDetailAdoptButton extends StatelessWidget {

  // Data Types

  final void Function() callback;

  // Constructor

  const PetDetailAdoptButton({super.key, required this.callback,});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: InkWell(
        onTap: () {
          callback.call();
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 32, left: 16, right: 16),
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              'Adopt Me',
              style: AppStyle.shared.customTextStyle(
                size: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
