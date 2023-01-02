import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tarefa_2/core/usecases/usecase.dart';
import 'package:tarefa_2/features/person/domain/entities/person.dart';
import 'package:tarefa_2/features/person/domain/repositories/person_repository.dart';
import 'package:tarefa_2/features/person/domain/usecases/get_random_person.dart';

class MockPersonRepository extends Mock implements PersonRepository {}

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
    nameFirst: 'test',
    nameLast: 'test',
    locationStreet: 'test',
    locationNumber: 123,
    locationCity: 'test',
    locationState: 'test',
    locationCountry: 'test',
    email: 'test',
    loginUser: 'test',
    loginPassword: 'test',
    dateOfBirth: 'test',
    age: 123,
    phone: 'test',
    cell: 'test',
    picture: 'test',
    nat: 'test',
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
