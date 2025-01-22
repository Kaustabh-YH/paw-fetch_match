import 'package:flutter/material.dart';
import 'package:pawfetch_match/core/constants/app_colors.dart';
import 'package:pawfetch_match/core/helpers/app_style_helper.dart';
import 'package:pawfetch_match/features/pet_adoption/data/models/pet_categories_model.dart';
import 'package:pawfetch_match/features/pet_adoption/data/models/pet_list_model.dart';
import 'package:pawfetch_match/features/pet_adoption/presentation/blocs/pet_adoption_bloc.dart';
import 'package:pawfetch_match/features/pet_adoption/presentation/widgets/pet_adoption_app_bar.dart';
import 'package:pawfetch_match/features/pet_adoption/presentation/widgets/pet_adoption_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pawfetch_match/features/pet_adoption_history/presentation/view/pet_adoption_history_page.dart';
import 'package:pawfetch_match/features/pet_details/presentation/view/pet_detail_page.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PetAdoptionListingPage extends StatelessWidget {
  const PetAdoptionListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    //Data Types

    PetAdoptionBloc bloc = PetAdoptionBloc();
    int currentPage = 1;
    bool isLoading = true;
    List<Categories> categories = [];
    List<Pets> pets = [];
    List<Pets> searchedPets = [];

    //Load Data

    bloc.add(FetchPetCategoriesAndPetAdoptionListEvent(page: currentPage));

    // Returnable Widget

    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: PetAdoptionAppBar(
        callback: () {
          bloc.add(MoveToPetAdoptionHistoryPageEvent());
        },
      ),
      body: BlocConsumer<PetAdoptionBloc, PetAdoptionState>(
        bloc: bloc,
        buildWhen: (previous, current) => current is! PetAdoptionActionState,
        listenWhen: (previous, current) => current is PetAdoptionActionState,
        listener: (context, state) {
          _handleListenerStates(context: context, state: state);
        },
        builder: (context, state) {
          if (state is PetAdoptionListLoadingState) {
            isLoading = true;
          } else if (state is PetAdoptionListErrorState) {
            isLoading = false;
          } else if (state is PetAdoptionListLoadedState) {
            categories = state.categories;
            pets = state.pets;
            isLoading = false;
          } else if(state is SearchedPetMatchUpdateState) {
            isLoading = false;
            searchedPets = state.matchedPet;
            if(searchedPets.isEmpty) {

            }
          }

          return Skeletonizer(
            enabled: isLoading,
            child: PetAdoptionBody(
              searchedTextCallback: (text) {
                bloc.add(SearchPetByNameEvent(petName: text, pets: pets));
              },
              pets: isLoading
                  ? List.generate(10, (index) {
                      return Pets(
                          id: 1,
                          imageUrl:
                              "https://images.squarespace-cdn.com/content/v1/54822a56e4b0b30bd821480c/45ed8ecf-0bb2-4e34-8fcf-624db47c43c8/Golden+Retrievers+dans+pet+care.jpeg",
                          name: 'Know',
                          location: 'AS',
                          category: 'Abc',
                          alreadyAdopted: false);
                    })
                  : searchedPets.isNotEmpty ? searchedPets : pets,
              categories: isLoading
                  ? List.generate(10, (index) {
                      return Categories(id: index, name: 'Category $index');
                    })
                  : categories,
              moveToPetDetailPageCallback: (petId) {
                final Pets details = pets.firstWhere((e) => e.id == petId);
                bloc.add(MoveToPetDetailPageEvent(petDetail: details));
              },
            ),
          );
        },
      ),
    );
  }

  /// This function is used to move the user the destined page
  /// [nextPage] : The destination page
  /// [context] : The build context

  _navigateToPage({required BuildContext context, required Widget nextPage}) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => nextPage),
    );
  }

  _handleListenerStates({
    required BuildContext context,
    required PetAdoptionState state,
  }) {
    if (state is MoveToPetDetailPageActionState) {
      _navigateToPage(
        context: context,
        nextPage: PetDetailPage(
          petDetail: state.petDetail,
        ),
      );
    } else if (state is MoveToAdoptedPetHistoryPage) {
      _navigateToPage(context: context, nextPage: PetAdoptionHistoryPage());
    } else if(state is NoSearchMatchState) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "No match found with your searched name",
            style: AppStyle.shared.customTextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
    }
  }
}