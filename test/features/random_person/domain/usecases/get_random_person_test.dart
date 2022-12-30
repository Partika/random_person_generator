import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tarefa_2/features/random_person/domain/entities/random_person.dart';
import 'package:tarefa_2/features/random_person/domain/repositories/random_person_repository.dart';
import 'package:tarefa_2/features/random_person/domain/usecases/get_random_person.dart';

class MockRandomPersonRepository extends Mock
    implements RandomPersonRepository {}

void main() {
  late GetRandomPerson usecase;
  late MockRandomPersonRepository mockRandomPersonRepository;
  setUp(
    () {
      mockRandomPersonRepository = MockRandomPersonRepository();
      usecase = GetRandomPerson(mockRandomPersonRepository);
    },
  );

  const RandomPerson tPerson = RandomPerson(
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
    when(mockRandomPersonRepository.getRandomPerson())
        .thenAnswer((_) async => const Right(tPerson));
    // act
    final result = await usecase(NoParams());
    // assert
    expect(result, const Right(tPerson));
    verify(mockRandomPersonRepository.getRandomPerson());
    verifyNoMoreInteractions(mockRandomPersonRepository);
  });
}
