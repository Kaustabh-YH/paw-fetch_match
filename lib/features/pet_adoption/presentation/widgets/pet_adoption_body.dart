import 'package:flutter/material.dart';
import 'package:pawfetch_match/core/constants/app_colors.dart';
import 'package:pawfetch_match/core/constants/image_assets.dart';
import 'package:pawfetch_match/core/helpers/app_style_helper.dart';
import 'package:pawfetch_match/core/helpers/svg_helper.dart';
import 'package:pawfetch_match/core/utility/debouncer.dart';
import 'package:pawfetch_match/features/pet_adoption/data/models/pet_categories_model.dart';
import 'package:pawfetch_match/features/pet_adoption/data/models/pet_list_model.dart';
import 'package:pawfetch_match/features/pet_adoption/presentation/widgets/pet_adotion_tiles/pet_categories_tile.dart';
import 'package:pawfetch_match/features/pet_adoption/presentation/widgets/pet_adotion_tiles/selected_pet_category_list_tile.dart';

class PetAdoptionBody extends StatelessWidget {
  //Data Types

  final void Function(int petId) moveToPetDetailPageCallback;
  final List<Categories> categories;
  final List<Pets> pets;
  final void Function(String searchedText) searchedTextCallback;
  final void Function(int catId) updateCatCallback;
  final int selectedCategoryId;

  //Constructor

  const PetAdoptionBody({
    super.key,
    required this.categories,
    required this.pets,
    required this.selectedCategoryId,
    required this.searchedTextCallback,
    required this.updateCatCallback,
    required this.moveToPetDetailPageCallback,
  });

  @override
  Widget build(BuildContext context) {

    final debouncer = Debouncer();
    final TextEditingController searchEditingController =
        TextEditingController();

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 24),
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: searchEditingController,
                        onChanged: (text) {
                          debouncer.run(
                            () {
                              searchedTextCallback.call(text);
                            },
                          );
                        },
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        onSubmitted: (_) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        maxLines: 1,
                        minLines: 1,
                        decoration: InputDecoration(
                          isCollapsed: false,
                          contentPadding: const EdgeInsets.all(8),
                          counterText: '',
                          border: InputBorder.none,
                          hintText: ' Search by pet name',
                          labelStyle: AppStyle.shared.customTextStyle(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SVGHelper.loadImage(assetName: ImageAssets.filter),
                    ),
                  )
                ],
              ),
            );
          case 1:
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 125,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                ImageAssets.petAdoptionBanner,
                fit: BoxFit.fitWidth,
              ),
            );
          case 2:
            return PetCategoriesTile(
              categories: categories,
              selectedCategoryId: selectedCategoryId,
              updateCallback: (catId) {
                updateCatCallback.call(catId);
              },
            );

          case 3:
            return SelectedPetCategoryListTile(
              pets: pets,
              callback: (int petId) {
                moveToPetDetailPageCallback.call(petId);
              },
            );

          default:
            break;
        }

        return null;
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 24);
      },
    );
  }
}
