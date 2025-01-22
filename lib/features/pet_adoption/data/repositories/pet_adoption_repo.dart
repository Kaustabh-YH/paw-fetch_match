import 'package:pawfetch_match/features/pet_adoption/data/models/pet_categories_model.dart';
import 'package:pawfetch_match/features/pet_adoption/data/models/pet_list_model.dart';
import 'package:pawfetch_match/features/pet_adoption/domain/repositories/pet_adoption_repo_interface.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';

class PetAdoptionRepo implements PetAdoptionRepoInterface {

  @override
  Future<PetListModel?> getAdoptablePetList({required int page}) async {

    try {
      // Load the JSON file from assets
      final SharedPreferences preferences = await SharedPreferences.getInstance();
      final vals = preferences.getStringList('adopted_ids') ?? [];

      final String response = await rootBundle.loadString('assets/jsons/adopt_pet.json');
      // Decode JSON
      final PetListModel data = PetListModel.fromJson(json.decode(response));

      if(vals.isNotEmpty) {
        for(Pets pet in data.pets ?? []) {
          if(vals.contains('${pet.id}')) {
            pet.alreadyAdopted = true;
          }
        }
      }

      return data;
    } catch (e) {
      rethrow;
    }

  }

  @override
  Future<PetCategoriesModel?> getPetCategories() async {
    try {
      // Load the JSON file from assets
      final String response = await rootBundle.loadString('assets/jsons/pet_categories.json');
      // Decode JSON
      final PetCategoriesModel data = PetCategoriesModel.fromJson(json.decode(response));
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  List<Pets> searchPetByName({required String pet, required List<Pets> pets}) {

    try {

      final List<Pets> matchedPetByName = pets.where((e) => e.name.toString().toLowerCase().contains(pet.toLowerCase()) ).toList();
      return matchedPetByName;

    } catch (e) {
      rethrow;
    }
  }

}