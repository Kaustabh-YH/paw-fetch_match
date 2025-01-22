part of 'pet_detail_bloc.dart';

@immutable
sealed class PetDetailState {}

final class PetDetailInitial extends PetDetailState {}
class PetDetailActionState extends PetDetailState {}

class PetDetailAdoptionInProgressState extends PetDetailState {}
class PetDetailAdoptionFailureState extends PetDetailState {}
class PetDetailAdoptionSuccessState extends PetDetailActionState {
  final int petId;

  PetDetailAdoptionSuccessState({required this.petId});
}

class PetDetailAdoptionUpdatedState extends PetDetailState {
  final int petId;

  PetDetailAdoptionUpdatedState({required this.petId});
}

class MoveToPetListingPageActionState extends PetDetailActionState {}
class MoveToPetInteractiveViewerActionState extends PetDetailActionState {}
