import 'package:flutter/material.dart';
import 'package:pawfetch_match/core/constants/app_colors.dart';
import 'package:pawfetch_match/core/helpers/app_style_helper.dart';
import 'package:pawfetch_match/features/pet_adoption/data/models/pet_categories_model.dart';

class PetCategoriesHorizontalList extends StatelessWidget {
  final List<Categories> categories;
  final int selectedCategoryId;

  const PetCategoriesHorizontalList({
    super.key,
    required this.categories,
    required this.selectedCategoryId,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          bool isSelected = categories[index].id == selectedCategoryId;

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primaryColor : Colors.white,
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.network(
                      'https://www.cdc.gov/healthy-pets/media/images/2024/04/GettyImages-598175960-cute-dog-headshot.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  categories[index].name.toString(),
                  style: AppStyle.shared.customTextStyle(
                    color: isSelected
                        ? Colors.white
                        : AppColors.fontSecondaryColor,
                    weight: isSelected ? FontWeight.w500 : FontWeight.w400,
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 16);
        },
      ),
    );
  }
}
