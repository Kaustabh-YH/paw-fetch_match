import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';

part 'pet_detail_event.dart';
part 'pet_detail_state.dart';

class PetDetailBloc extends Bloc<PetDetailEvent, PetDetailState> {
  PetDetailBloc() : super(PetDetailInitial()) {
    on<PetDetailEvent>((event, emit) {});
    on<AdoptMeTapActionEvent>(confirmAdoption);
    on<MoveToPetListingPageEvent>(moveToPetListIngPage);
    on<MoveToPetInteractiveImageViewerEvent>(moveToPetInteractiveImageViewerPage);
  }

  //Event Handling Methods

  FutureOr<void> confirmAdoption(
      AdoptMeTapActionEvent event, Emitter<PetDetailState> emit) async {

    emit(PetDetailAdoptionUpdatedState(petId: event.petId));

    await Future.delayed(const Duration(seconds: 1), () {
      emit(PetDetailAdoptionSuccessState(petId: event.petId));
    });
  }

  FutureOr<void> moveToPetListIngPage(
      MoveToPetListingPageEvent event, Emitter<PetDetailState> emit) {

    emit(MoveToPetListingPageActionState());

  }

  FutureOr<void> moveToPetInteractiveImageViewerPage(
      MoveToPetInteractiveImageViewerEvent event, Emitter<PetDetailState> emit) {

    emit(MoveToPetInteractiveViewerActionState());

  }


}
