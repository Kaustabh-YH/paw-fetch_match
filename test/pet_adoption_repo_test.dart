import 'package:pawfetch_match/features/pet_adoption/data/models/pet_list_model.dart';
import 'package:pawfetch_match/features/pet_adoption/data/repositories/pet_adoption_repo.dart';
import 'package:test/test.dart';

void main() {
  group('PetAdoptionRepo', () {
    final petRepo = PetAdoptionRepo();

    test('should return a list of pets that match the name', () {
      // Arrange: Create mock pet data
      final pets = [
        Pets(name: 'Dog', id: 1),
        Pets(name: 'Cat', id: 2),
        Pets(name: 'Dolphin', id: 3),
      ];

      final petNameToSearch = 'dog';

      // Act: Call searchPetByName
      final result = petRepo.searchPetByName(pet: petNameToSearch, pets: pets);

      // Assert: Verify the result contains the expected pet
      expect(result, isNotEmpty);
      expect(result.length, 1); // Should return exactly 1 match
      expect(result.first.name, 'Dog'); // The matching pet should have the name 'Dog'
    });

    test('should return an empty list if no pets match the name', () {
      // Arrange: Create mock pet data
      final pets = [
        Pets(name: 'Dog', id: 1),
        Pets(name: 'Cat', id: 2),
        Pets(name: 'Dolphin', id: 3),
      ];

      final petNameToSearch = 'elephant';

      // Act: Call searchPetByName
      final result = petRepo.searchPetByName(pet: petNameToSearch, pets: pets);

      // Assert: Verify the result is empty
      expect(result, isEmpty); // No pet should match the name 'elephant'
    });
  });
}