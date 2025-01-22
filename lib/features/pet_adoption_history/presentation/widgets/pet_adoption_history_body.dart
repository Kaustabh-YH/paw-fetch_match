import 'package:flutter/material.dart';
import 'package:pawfetch_match/features/pet_adoption_history/presentation/widgets/tiles/pet_adoption_history_tile.dart';

class PetAdoptionHistoryBody extends StatelessWidget {

  final ScrollController controller;
  final int currentPage;

  const PetAdoptionHistoryBody({
    super.key,
    required this.controller,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: controller,
      padding: const EdgeInsets.all(16),
      itemCount: 10 * currentPage,
      itemBuilder: (context, index) {
        return PetAdoptionHistoryTile();
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
    );
  }
}
