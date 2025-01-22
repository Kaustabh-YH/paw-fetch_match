part of 'pet_adoption_bloc.dart';

@immutable
sealed class PetAdoptionState {}

final class PetAdoptionInitial extends PetAdoptionState {}
class PetAdoptionActionState extends PetAdoptionState {}
class PetAdoptionListLoadingState extends PetAdoptionState {}
class PetAdoptionListLoadedState extends PetAdoptionState {
  final List<Categories> categories;
  final List<Pets> pets;

  PetAdoptionListLoadedState({required this.categories, required this.pets,});
}

class SearchedPetMatchUpdateState extends PetAdoptionState {

  final List<Pets> matchedPet;

  SearchedPetMatchUpdateState({required this.matchedPet});
}

class NoSearchMatchState extends PetAdoptionActionState {}

class PetAdoptionListErrorState extends PetAdoptionState {}

class MoveToPetDetailPageActionState extends PetAdoptionActionState {
  final Pets petDetail;

  MoveToPetDetailPageActionState({required this.petDetail});
}

class MoveToAdoptedPetHistoryPage extends PetAdoptionActionState {}

class UpdatedAdoptionListingState extends PetAdoptionState {
  final int petId;

  UpdatedAdoptionListingState({required this.petId});
}


