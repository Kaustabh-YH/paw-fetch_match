import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:pawfetch_match/features/pet_adoption/data/models/pet_list_model.dart';
import 'package:pawfetch_match/features/pet_details/presentation/widgets/pet_detail_adopt_button.dart';
import 'package:pawfetch_match/features/pet_details/presentation/widgets/pet_detail_confetti_container.dart';
import 'package:pawfetch_match/features/pet_details/presentation/widgets/pet_detail_image_container.dart';
import 'package:pawfetch_match/features/pet_details/presentation/widgets/pet_detail_info_container.dart';

class PetDetailPageBody extends StatelessWidget {
  // Data Types

  final void Function() imageTapCallback;
  final void Function() adoptMeCallback;
  final void Function() backButtonCallback;
  final ConfettiController confettiController;
  final Pets petDetail;

  // Constructor

  const PetDetailPageBody({
    super.key,
    required this.imageTapCallback,
    required this.petDetail,
    required this.adoptMeCallback,
    required this.backButtonCallback,
    required this.confettiController,
  });

  //Build Widget

  @override
  Widget build(BuildContext context) {
    // Data Types

    final double height = MediaQuery.of(context).size.height;

    // Returnable Widget

    return SizedBox(
      width: double.infinity,
      height: height,
      child: Stack(
        children: [
          PetDetailImageContainer(
            petDetail: petDetail,
            height: height,
            imageTapCallback: () {
              imageTapCallback.call();
            },
            backButtonCallback: () {
              backButtonCallback.call();
            },
          ),
          PetDetailInfoContainer(height: height, petDetail: petDetail,),
          PetDetailAdoptButton(
            callback: () {
              adoptMeCallback.call();
            },
          ),
          PetDetailConfettiContainer(confettiController: confettiController),
        ],
      ),
    );
  }
}
