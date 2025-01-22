part of 'pet_detail_bloc.dart';

@immutable
sealed class PetDetailEvent {}

class AdoptMeTapActionEvent extends PetDetailEvent {
  final int petId;

  AdoptMeTapActionEvent({required this.petId});
}

class MoveToPetListingPageEvent extends PetDetailEvent {}
class MoveToPetInteractiveImageViewerEvent extends PetDetailEvent {}
