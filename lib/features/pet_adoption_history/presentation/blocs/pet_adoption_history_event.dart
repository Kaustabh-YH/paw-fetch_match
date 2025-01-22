part of 'pet_adoption_history_bloc.dart';

@immutable
sealed class PetAdoptionHistoryEvent {}
class LoadMoreDataEvent extends PetAdoptionHistoryEvent {
  final int currentPage;

  LoadMoreDataEvent({required this.currentPage});
}

