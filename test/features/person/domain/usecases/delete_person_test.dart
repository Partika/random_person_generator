import 'package:mockito/annotations.dart';
import 'package:random_person_generator/features/person/domain/repositories/person_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:random_person_generator/core/usecases/usecase.dart';
import 'package:random_person_generator/features/person/domain/usecases/delete_person.dart';
import './delete_person_test.mocks.dart';

@GenerateMocks([PersonRepository])
void main() {
  late DeletePerson usecase;
  late MockPersonRepository mockPersonRepository;
  setUp(
    () {
      mockPersonRepository = MockPersonRepository();
      usecase = DeletePerson(mockPersonRepository);
    },
  );

  test('should get person from the repository', () async {
    // arrange
    when(mockPersonRepository.deletePerson())
        .thenAnswer((_) async => Right(Future<void>.value()));
    // act
    await usecase(NoParams());
    // assert
    verify(mockPersonRepository.deletePerson());
    verifyNoMoreInteractions(mockPersonRepository);
  });
}
