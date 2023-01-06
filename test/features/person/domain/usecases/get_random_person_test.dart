import 'package:mockito/annotations.dart';
import 'package:random_person_generator/features/person/domain/repositories/person_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:random_person_generator/core/usecases/usecase.dart';
import 'package:random_person_generator/features/person/domain/entities/person.dart';
import 'package:random_person_generator/features/person/domain/usecases/get_random_person.dart';
import './get_random_person_test.mocks.dart';

@GenerateMocks([PersonRepository])
void main() {
  late GetRandomPerson usecase;
  late MockPersonRepository mockPersonRepository;
  setUp(
    () {
      mockPersonRepository = MockPersonRepository();
      usecase = GetRandomPerson(mockPersonRepository);
    },
  );

  const Person tPerson = Person(
    nameFirst: 'Test FName',
    nameLast: 'Test LName',
    locationStreet: 'Test Street',
    locationNumber: 123,
    locationCity: 'Test City',
    locationState: 'Test State',
    locationCountry: 'Test Country',
    email: 'Test Email',
    dateOfBirth: 'Test DoB',
    age: 123,
    phone: 'Test Phone',
    cell: 'Test Cell',
    picture: 'Test Pic Link',
    nat: 'Test Nat',
  );

  test('should get person from the repository', () async {
    // arrange
    when(mockPersonRepository.getRandomPerson())
        .thenAnswer((_) async => const Right(tPerson));
    // act
    final result = await usecase(NoParams());
    // assert
    expect(result, const Right(tPerson));
    verify(mockPersonRepository.getRandomPerson());
    verifyNoMoreInteractions(mockPersonRepository);
  });
}
