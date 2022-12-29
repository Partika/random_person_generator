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

  const tSeed = '56d27f4a53bd5441';
  const RandomPerson tPerson = RandomPerson(
    nameFirst: 'Eva',
    nameLast: 'Martin',
    locationStreet: 'St. Lawrence Ave',
    locationNumber: 8929,
    locationCity: 'Burlington',
    locationState: 'Northwest Territories',
    locationCountry: 'Canada',
    email: 'eva.martin@example.com',
    loginUser: 'yellowpeacock117',
    loginPassword: 'addison',
    dateOfBirth: '1992-03-08T15:13:16.688Z',
    age: 30,
    phone: 'B72 T90-0888',
    cell: 'H89 E30-2385',
    picture: 'https://randomuser.me/api/portraits/med/women/75.jpg',
    nat: 'CA',
  );

  test('should get person from the repository', () async {
    // arrange
    when(mockRandomPersonRepository.getRandomPerson(any))
        .thenAnswer((_) async => const Right(tPerson));
    // act
    final result = await usecase.execute(tSeed);
    // assert
    expect(result, const Right(tPerson));
    verify(mockRandomPersonRepository.getRandomPerson(tSeed));
    verifyNoMoreInteractions(mockRandomPersonRepository);
  });
}
