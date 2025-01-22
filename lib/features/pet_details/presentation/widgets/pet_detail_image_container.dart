import 'package:flutter/material.dart';
import 'package:pawfetch_match/core/constants/image_assets.dart';
import 'package:pawfetch_match/core/helpers/svg_helper.dart';
import 'package:pawfetch_match/features/pet_adoption/data/models/pet_list_model.dart';

class PetDetailImageContainer extends StatelessWidget {
  // Data Types

  final Pets petDetail;
  final double height;
  final void Function() backButtonCallback;
  final void Function() imageTapCallback;

  // Constructor

  const PetDetailImageContainer({
    super.key,
    required this.height,
    required this.petDetail,
    required this.imageTapCallback,
    required this.backButtonCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'hero-detail-${petDetail.id}',
      child: Material(
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                imageTapCallback.call();
              },
              child: SizedBox(
                height: height * 0.5,
                child: Image.network(
                  petDetail.imageUrl ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48, left: 16),
              child: Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    backButtonCallback.call();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    width: 50,
                    height: 50,
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48, right: 16),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  width: 44,
                  height: 44,
                  child: SVGHelper.loadImage(assetName: ImageAssets.heart, color: Colors.red,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}