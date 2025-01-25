import 'package:flutter/material.dart';
import 'package:pawfetch_match/core/constants/app_colors.dart';
import 'package:pawfetch_match/core/constants/image_assets.dart';
import 'package:pawfetch_match/core/helpers/app_style_helper.dart';
import 'package:pawfetch_match/core/helpers/svg_helper.dart';
import 'package:pawfetch_match/features/pet_adoption/data/models/pet_list_model.dart';
import 'package:pawfetch_match/shared/widgets/list_header_tile.dart';

class SelectedPetCategoryListTile extends StatelessWidget {
  // Data Types

  final void Function(int petId) callback;
  final List<Pets> pets;

  // Constructor

  const SelectedPetCategoryListTile({
    super.key,
    required this.pets,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListHeaderTile(
          primaryTitle: 'Adopt Pet',
          secondaryTitle: 'View all',
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 300,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            scrollDirection: Axis.horizontal,
            itemCount: pets.length,
            itemBuilder: (context, index) {

              Pets pet = pets[index];

              return Material(
                color: Colors.transparent,
                surfaceTintColor: Colors.white,
                child: InkWell(
                  onTap: () {
                    callback.call(pet.id ?? 0);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.grey.shade50, // Shadow color with opacity
                            spreadRadius: 2, // How far the shadow spreads
                            blurRadius: 5, // How soft the shadow is
                            offset: Offset(2, 2), // X and Y offset of the shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: 'hero-detail-${pet.id}',
                            child: SizedBox(
                              width: 250,
                              height: 200,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(40),
                                    ),
                                    child: pet.alreadyAdopted ?? false ? ColorFiltered(
                                      colorFilter: ColorFilter.mode(
                                        Colors.grey,
                                        BlendMode.saturation,
                                      ),
                                      child: Container(
                                        height: 200,
                                        foregroundDecoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [Colors.black12, Colors.black26],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ),
                                        ),
                                        child: Image.network(
                                          pet.imageUrl ?? '',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ) : Container(
                                      height: 200,
                                      foregroundDecoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [Colors.black12, Colors.black26],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                      ),
                                      child: Image.network(
                                        pet.imageUrl ?? '',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        pet.alreadyAdopted ?? false ? EdgeInsets.zero : EdgeInsets.only(top: 16, right: 16),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child:  pet.alreadyAdopted ?? false ? Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),),
                                        ),
                                        child: Text('Already Adopted', style: AppStyle.shared.customTextStyle(size: 12),),
                                      ) : Container(
                                        padding: const EdgeInsets.all(8),
                                        width: 36,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: SVGHelper.loadImage(
                                          assetName: ImageAssets.heart,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      pet.name ?? '',
                                      style: AppStyle.shared.customTextStyle(),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.pin_drop,
                                          color: AppColors.fontSecondaryColor,
                                        ),
                                        Text(
                                          pet.location ?? '',
                                          style: AppStyle.shared.customTextStyle(
                                            size: 14,
                                            weight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 16);
            },
          ),
        )
      ],
    );
  }
}
