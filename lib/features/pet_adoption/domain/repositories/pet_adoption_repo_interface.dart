import 'package:pawfetch_match/features/pet_adoption/data/models/pet_categories_model.dart';
import 'package:pawfetch_match/features/pet_adoption/data/models/pet_list_model.dart';

abstract class PetAdoptionRepoInterface {
  Future<PetCategoriesModel?> getPetCategories();
  Future<PetListModel?> getAdoptablePetList({required int page});
  List<Pets> searchPetByName({required String pet, required List<Pets> pets});
}