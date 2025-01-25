import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pawfetch_match/core/helpers/app_style_helper.dart';
import 'package:pawfetch_match/features/pet_adoption/data/models/pet_list_model.dart';
import 'package:pawfetch_match/features/pet_details/presentation/blocs/pet_detail_bloc.dart';
import 'package:pawfetch_match/features/pet_details/presentation/view/pet_detail_image_interactive_viewer.dart';
import 'package:pawfetch_match/features/pet_details/presentation/widgets/pet_detail_page_body.dart';

class PetDetailPage extends StatelessWidget {
  //Data Types

  final Pets petDetail;
  final void Function(int) isAdoptedCallback;

  //Constructor

  const PetDetailPage({
    super.key,
    required this.isAdoptedCallback,
    required this.petDetail,
  });

  @override
  Widget build(BuildContext context) {
    //Data Types

    final PetDetailBloc bloc = PetDetailBloc();
    final ConfettiController confettiController =
        ConfettiController(duration: const Duration(seconds: 2));

    // Returnable Widget

    return Scaffold(
      body: BlocConsumer<PetDetailBloc, PetDetailState>(
        bloc: bloc,
        listenWhen: (previous, current) => current is PetDetailActionState,
        buildWhen: (previous, current) => current is! PetDetailActionState,
        listener: (context, state) {
          if (state is PetDetailAdoptionSuccessState) {
            confettiController.play();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.black,
                content: Text(
                  "You've now adopted ${petDetail.name}",
                  style: AppStyle.shared.customTextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            );
          } else if (state is MoveToPetListingPageActionState) {
            Navigator.of(context).pop();
          } else if(state is MoveToPetInteractiveViewerActionState) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PetDetailImageInteractiveViewer(imageUrl: petDetail.imageUrl ?? '',)));
          }
        },
        builder: (context, state) {

          if(state is PetDetailAdoptionUpdatedState) {
            isAdoptedCallback.call(petDetail.id ?? 0);
            petDetail.alreadyAdopted = true;
          }

          return PetDetailPageBody(
            petDetail: petDetail,
            backButtonCallback: () {
              bloc.add(MoveToPetListingPageEvent());
            },
            imageTapCallback: () {
              bloc.add(MoveToPetInteractiveImageViewerEvent());
            },
            confettiController: confettiController,
            adoptMeCallback: () {
              bloc.add(AdoptMeTapActionEvent(petId: 1));
            },
          );
        },
      ),
    );
  }
}
