part of 'pet_adoption_bloc.dart';

@immutable
sealed class PetAdoptionEvent {}

class FetchPetCategoriesAndPetAdoptionListEvent extends PetAdoptionEvent {
  final int page;

  FetchPetCategoriesAndPetAdoptionListEvent({required this.page});
}

class MoveToPetDetailPageEvent extends PetAdoptionEvent {
  final Pets petDetail;

  MoveToPetDetailPageEvent({required this.petDetail});
}

class MoveToPetAdoptionHistoryPageEvent extends PetAdoptionEvent {}

class SearchPetByNameEvent extends PetAdoptionEvent {
  final String petName;
  final List<Pets> pets;

  SearchPetByNameEvent({
    required this.petName,
    required this.pets,
  });
}
