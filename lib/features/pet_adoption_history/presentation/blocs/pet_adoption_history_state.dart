part of 'pet_adoption_history_bloc.dart';

@immutable
sealed class PetAdoptionHistoryState {}

final class PetAdoptionHistoryInitial extends PetAdoptionHistoryState {}
final class UpdateCurrentPageState extends PetAdoptionHistoryState {
  final int currentPage;

  UpdateCurrentPageState({required this.currentPage});
}
