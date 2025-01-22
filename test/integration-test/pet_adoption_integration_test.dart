import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pawfetch_match/features/pet_adoption/data/models/pet_list_model.dart';
import 'package:pawfetch_match/features/pet_adoption/data/repositories/pet_adoption_repo.dart';


void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('PetAdoptionRepo Integration Test', () {
    final petRepo = PetAdoptionRepo();

    testWidgets('should fetch and search pets by name', (WidgetTester tester) async {
      // Load mock JSON data for adopt_pet.json file
      final String mockAdoptPetJson = '''
      {
        "pets": [
          {"name": "Dog", "id": 1},
          {"name": "Cat", "id": 2},
          {"name": "Dolphin", "id": 3}
        ]
      }
      ''';

      // Mocking the asset loading
      await tester.pumpAndSettle();
      const assetPath = 'assets/jsons/adopt_pet.json';
      await rootBundle.loadString(assetPath); // Ensure the mock asset exists

      // Act: Mock the JSON response for getAdoptablePetList
      final petList = PetListModel.fromJson(jsonDecode(mockAdoptPetJson));

      // Act: Perform the search operation on the pet list
      final petNameToSearch = 'dog';
      final result = petRepo.searchPetByName(pet: petNameToSearch, pets: petList.pets ?? []);

      // Assert: Verify that the pet list contains the matching name 'Dog'
      expect(result, isNotEmpty);
      expect(result.length, 1);
      expect(result.first.name, 'Dog');

      // Act: Perform a search for a non-matching pet
      final nonMatchingSearch = 'elephant';
      final noMatchResult = petRepo.searchPetByName(pet: nonMatchingSearch, pets: petList.pets ?? []);

      // Assert: Verify that no pets match 'elephant'
      expect(noMatchResult, isEmpty);
    });
  });
}