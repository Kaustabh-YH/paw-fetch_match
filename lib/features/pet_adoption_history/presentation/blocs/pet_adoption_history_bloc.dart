import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';

part 'pet_adoption_history_event.dart';
part 'pet_adoption_history_state.dart';

class PetAdoptionHistoryBloc extends Bloc<PetAdoptionHistoryEvent, PetAdoptionHistoryState> {
  PetAdoptionHistoryBloc() : super(PetAdoptionHistoryInitial()) {
    on<PetAdoptionHistoryEvent>((event, emit) {});
    on<LoadMoreDataEvent>(loadMoreData);
  }

  FutureOr<void> loadMoreData(
      LoadMoreDataEvent event, Emitter<PetAdoptionHistoryState> emit) {

    emit(UpdateCurrentPageState(currentPage: event.currentPage + 1));

  }
}
