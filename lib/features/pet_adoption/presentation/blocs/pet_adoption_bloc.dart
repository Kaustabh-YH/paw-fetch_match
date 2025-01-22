import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:pawfetch_match/features/pet_adoption/data/models/pet_categories_model.dart';
import 'package:pawfetch_match/features/pet_adoption/data/models/pet_list_model.dart';
import 'package:pawfetch_match/features/pet_adoption/data/repositories/pet_adoption_repo.dart';
import 'package:pawfetch_match/features/pet_details/presentation/view/pet_detail_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'pet_adoption_event.dart';
part 'pet_adoption_state.dart';

class PetAdoptionBloc extends Bloc<PetAdoptionEvent, PetAdoptionState> {
  final PetAdoptionRepo repo = PetAdoptionRepo();

  PetAdoptionBloc() : super(PetAdoptionInitial()) {
    on<PetAdoptionEvent>((event, emit) {});
    on<MoveToPetDetailPageEvent>(moveUserToPetDetailPage);
    on<SearchPetByNameEvent>(searchPetByName);
    on<MoveToPetAdoptionHistoryPageEvent>(moveUserToAdoptedPetHistoryPage);
    on<FetchPetCategoriesAndPetAdoptionListEvent>(
        fetchPetCategoriesAndAdoptionList);
    on<UpdateCategoryIdEvent>(updateCategoryId);
    on<UpdateAdoptionEvent>(updateAdoption);
  }

  //Event Methods

  /// This function is used to handle the [MoveToPetDetailPageEvent] which emits [MoveToPetDetailPageActionState]
  /// which navigates the user to the [PetDetailPage]

  FutureOr<void> moveUserToPetDetailPage(
      MoveToPetDetailPageEvent event, Emitter<PetAdoptionState> emit) {
    emit(MoveToPetDetailPageActionState(petDetail: event.petDetail));
  }

  FutureOr<void> updateAdoption(
      UpdateAdoptionEvent event, Emitter<PetAdoptionState> emit) async {

    //Best way is to directly update the value matching key in the json file using PathProvider and reading the File and updating the file

    final preferences = await SharedPreferences.getInstance();
    final vals = preferences.getStringList('adopted_ids') ?? [];
    if(vals.isNotEmpty) {
      vals.add('${event.petId}');
      preferences.setStringList('adopted_ids', vals);
    } else {
      preferences.setStringList('adopted_ids', ['${event.petId}']);
    }

    emit(UpdatedAdoptionListingState(petId: event.petId));
  }

  /// This function is used to handle the [MoveToPetAdoptionHistoryPageEvent] which emits [MoveToAdoptedPetHistoryPage]
  /// which navigates the user to the [Pet]

  FutureOr<void> moveUserToAdoptedPetHistoryPage(
      MoveToPetAdoptionHistoryPageEvent event, Emitter<PetAdoptionState> emit) {
    emit(MoveToAdoptedPetHistoryPage());
  }

  FutureOr<void> updateCategoryId(
      UpdateCategoryIdEvent event, Emitter<PetAdoptionState> emit) {

    final catName = event.categories.firstWhere((e) => e.id == event.catId).name;
    final pets = event.pets.where((e) => e.category.toString().toLowerCase() == catName.toString().toLowerCase()).toList();

    emit(PetAdoptionListLoadedState(categories: event.categories, pets: pets));
  }

  FutureOr<void> fetchPetCategoriesAndAdoptionList(
      FetchPetCategoriesAndPetAdoptionListEvent event,
      Emitter<PetAdoptionState> emit) async {
    emit(PetAdoptionListLoadingState());

    try {
      final PetCategoriesModel? petCategoriesModel =
          await repo.getPetCategories();
      final PetListModel? petListModel =
          await repo.getAdoptablePetList(page: event.page);

      emit(PetAdoptionListLoadedState(
          categories: petCategoriesModel?.categories ?? [],
          pets: petListModel?.pets ?? []));
    } catch (_) {
      emit(
          PetAdoptionListErrorState()); //Hardcoding error text at this time else will have used error.localizedDescription
    }
  }

  FutureOr<void> searchPetByName(
      SearchPetByNameEvent event, Emitter<PetAdoptionState> emit) async {

    emit(PetAdoptionListLoadingState());

    try {
      final List<Pets> matchedPet = repo.searchPetByName(pet: event.petName, pets: event.pets);
      emit(SearchedPetMatchUpdateState(matchedPet: matchedPet));

      if(matchedPet.isEmpty) {
        await Future.delayed(const Duration(seconds: 1), () {
          emit(NoSearchMatchState());
        });
      }

    } catch (_) {
      emit(PetAdoptionListErrorState()); //Hardcoding error text at this time else will have used error.localizedDescription
    }
  }
}
