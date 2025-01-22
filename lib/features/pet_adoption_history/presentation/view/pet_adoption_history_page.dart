import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pawfetch_match/core/constants/app_colors.dart';
import 'package:pawfetch_match/core/constants/image_assets.dart';
import 'package:pawfetch_match/core/helpers/app_style_helper.dart';
import 'package:pawfetch_match/features/pet_adoption_history/presentation/blocs/pet_adoption_history_bloc.dart';
import 'package:pawfetch_match/features/pet_adoption_history/presentation/widgets/pet_adoption_history_body.dart';
import 'package:pawfetch_match/shared/widgets/custom_app_bar.dart';
import 'package:pawfetch_match/shared/widgets/custom_icon_button.dart';

class PetAdoptionHistoryPage extends StatelessWidget {
  const PetAdoptionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {

    final ScrollController scrollController = ScrollController();
    final PetAdoptionHistoryBloc bloc = PetAdoptionHistoryBloc();
    int currentPage = 1;
    int totalPages = 5;
    bool isLoading = false;
    bool isAllLoaded = false;
    bool hasSnackbarBeenShown = false; // New flag

    scrollController.addListener(() async {
      if (isLoading) {
        return;
      }

      if (currentPage > totalPages) {
        if (!isAllLoaded) {
          isAllLoaded = true;

          if (!hasSnackbarBeenShown) { // Check if snackbar has already been shown
            hasSnackbarBeenShown = true;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'No more data to load',
                  style: AppStyle.shared.customTextStyle(color: Colors.white),
                ),
              ),
            );
          }
        }
        return;
      }

      if (scrollController.position.pixels > scrollController.position.maxScrollExtent * 0.8) {
        if (currentPage >= totalPages) {
          if (!hasSnackbarBeenShown) { // Ensure the snackbar is only shown once
            hasSnackbarBeenShown = true;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'No more data to load',
                  style: AppStyle.shared.customTextStyle(color: Colors.white),
                ),
              ),
            );
          }
          return;
        }

        bloc.add(LoadMoreDataEvent(currentPage: currentPage + 1));
        isLoading = true;

        // Reset the flag when new data is being loaded
        hasSnackbarBeenShown = false;
      }
    });
    
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: CustomAppBar(
        leading: CustomIconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          assetName: ImageAssets.backArrow,
        ),
        title: 'Adoption History',
      ),
      body: BlocBuilder<PetAdoptionHistoryBloc, PetAdoptionHistoryState>(
        bloc: bloc,
        builder: (context, state) {
          if(state is UpdateCurrentPageState) {
            currentPage = state.currentPage;
            isLoading = false;
          }
          return PetAdoptionHistoryBody(controller: scrollController, currentPage: currentPage,);
        },
      )
    );
  }
}
