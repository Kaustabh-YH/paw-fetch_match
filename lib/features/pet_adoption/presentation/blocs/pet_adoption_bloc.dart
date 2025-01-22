import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:pawfetch_match/features/pet_adoption/data/models/pet_categories_model.dart';
import 'package:pawfetch_match/features/pet_adoption/data/models/pet_list_model.dart';
import 'package:pawfetch_match/features/pet_adoption/data/repositories/pet_adoption_repo.dart';
import 'package:pawfetch_match/features/pet_details/presentation/view/pet_detail_page.dart';

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
  }

  //Event Methods

  /// This function is used to handle the [MoveToPetDetailPageEvent] which emits [MoveToPetDetailPageActionState]
  /// which navigates the user to the [PetDetailPage]

  FutureOr<void> moveUserToPetDetailPage(
      MoveToPetDetailPageEvent event, Emitter<PetAdoptionState> emit) {
    emit(MoveToPetDetailPageActionState(petDetail: event.petDetail));
  }

  /// This function is used to handle the [MoveToPetAdoptionHistoryPageEvent] which emits [MoveToAdoptedPetHistoryPage]
  /// which navigates the user to the [Pet]

  FutureOr<void> moveUserToAdoptedPetHistoryPage(
      MoveToPetAdoptionHistoryPageEvent event, Emitter<PetAdoptionState> emit) {
    emit(MoveToAdoptedPetHistoryPage());
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
