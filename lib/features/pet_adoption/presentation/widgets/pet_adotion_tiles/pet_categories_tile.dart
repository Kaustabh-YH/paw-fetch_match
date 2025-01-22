import 'package:flutter/material.dart';
import 'package:pawfetch_match/features/pet_adoption/data/models/pet_categories_model.dart';
import 'package:pawfetch_match/features/pet_adoption/presentation/widgets/pet_adotion_tiles/widgets/pet_categories_horizontal_list.dart';
import 'package:pawfetch_match/shared/widgets/list_header_tile.dart';

class PetCategoriesTile extends StatelessWidget {

  final List<Categories> categories;
  final int selectedCategoryId;

  const PetCategoriesTile({super.key, required this.categories, required this.selectedCategoryId,});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListHeaderTile(
          primaryTitle: 'Pet Categories',
          secondaryTitle: 'View all',
        ),
        const SizedBox(height: 16),
        PetCategoriesHorizontalList(categories: categories, selectedCategoryId: selectedCategoryId,),
      ],
    );
  }
}
