import 'package:flutter/material.dart';
import 'package:pawfetch_match/features/pet_adoption_history/presentation/widgets/tiles/pet_adoption_history_tile.dart';

class PetAdoptionHistoryBody extends StatelessWidget {
  const PetAdoptionHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: 10,
      itemBuilder: (context, index) {
        return PetAdoptionHistoryTile();
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
    );
  }
}
