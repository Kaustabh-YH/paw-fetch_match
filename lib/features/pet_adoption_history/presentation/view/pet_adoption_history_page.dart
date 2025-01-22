import 'package:flutter/material.dart';
import 'package:pawfetch_match/core/constants/app_colors.dart';
import 'package:pawfetch_match/core/constants/image_assets.dart';
import 'package:pawfetch_match/features/pet_adoption_history/presentation/widgets/pet_adoption_history_body.dart';
import 'package:pawfetch_match/shared/widgets/custom_app_bar.dart';
import 'package:pawfetch_match/shared/widgets/custom_icon_button.dart';

class PetAdoptionHistoryPage extends StatelessWidget {
  const PetAdoptionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: CustomAppBar(
        leading: CustomIconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          assetName: ImageAssets.backArrow,
        ),
        title: 'Adoption History',
      ),
      body: PetAdoptionHistoryBody(),
    );
  }
}
