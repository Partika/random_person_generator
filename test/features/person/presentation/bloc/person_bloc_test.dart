import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:random_person_generator/core/error/failures.dart';
import 'package:random_person_generator/core/usecases/usecase.dart';
import 'package:random_person_generator/features/person/domain/entities/person.dart';
import 'package:random_person_generator/features/person/domain/usecases/delete_person.dart';
import 'package:random_person_generator/features/person/domain/usecases/get_random_person.dart';
import 'package:random_person_generator/features/person/presentation/bloc/person/person_bloc.dart';

import 'person_bloc_test.mocks.dart';

// class MockPersonBloc extends MockBloc<PersonEvent, PersonState>
//     implements PersonBloc {
//   MockPersonBloc({random}) : super(random: random);
// }

@GenerateMocks([GetRandomPerson, DeletePerson])
void main() {
  late PersonBloc bloc;
  late MockGetRandomPerson mockGetRandomPerson;
  late MockDeletePerson mockDeletePerson;

  setUp(() {
    mockGetRandomPerson = MockGetRandomPerson();
    mockDeletePerson = MockDeletePerson();
    bloc = PersonBloc(random: mockGetRandomPerson, delete: mockDeletePerson);
  });

  blocTest(
    'emits [EmptyState] when initial state.',
    build: () => bloc,
    expect: () => [],
  );

  group('GetRandomPersonEvent', () {
    const tPerson = Person(
      nameFirst: 'nameFirst',
      nameLast: 'nameLast',
      locationStreet: 'locationStreet',
      locationNumber: 123,
      locationCity: 'locationCity',
      locationLatitude: 'locationState',
      locationLongitude: 'locationCountry',
      email: 'email',
      username: 'username',
      dateOfBirth: 'dateOfBirth',
      age: 123,
      phone: 'phone',
      cell: 'cell',
      picture: 'picture',
    );

    test(
      'should get data from the random use case',
      () async {
        // arrange
        when(mockGetRandomPerson(any))
            .thenAnswer((_) async => const Right(tPerson));
        // act
        bloc.add(GetRandomPersonEvent());
        await untilCalled(mockGetRandomPerson(any));
        // assert
        verify(mockGetRandomPerson(NoParams()));
      },
    );

    // when(mockGetRandomPerson(any))
    //     .thenAnswer((_) async => const Right(tPerson));
    blocTest<PersonBloc, PersonState>(
      'should emit [LoadingEvent, LoadedEvent] when data is gotten successfully.',
      build: () {
        when(mockGetRandomPerson(any))
            .thenAnswer((_) async => const Right(tPerson));
        return bloc;
      },
      act: (bloc) => bloc.add(GetRandomPersonEvent()),
      expect: () => [
        LoadingState(),
        const LoadedState(person: tPerson),
      ],
    );

    blocTest<PersonBloc, PersonState>(
      'should emit [EmptyEvent] when data is deleted.',
      build: () {
        when(mockDeletePerson(any))
            .thenAnswer((_) async => Right(Future<void>.value()));
        return bloc;
      },
      act: (bloc) => bloc.add(DeletePersonEvent()),
      expect: () => [EmptyState()],
    );

    group('Failures', () {
      blocTest<PersonBloc, PersonState>(
        'should emit [LoadingEvent, ErrorEvent] when getting data fails.',
        build: () {
          when(mockGetRandomPerson(any))
              .thenAnswer((_) async => Left(ServerFailure()));
          return bloc;
        },
        act: (bloc) => bloc.add(GetRandomPersonEvent()),
        expect: () => [
          LoadingState(),
          const ErrorState(message: serverFailureMessage),
        ],
      );

      blocTest<PersonBloc, PersonState>(
        'should emit [LoadingEvent, ErrorEvent] whit proper message for the error when getting data fails.',
        build: () {
          when(mockGetRandomPerson(any))
              .thenAnswer((_) async => Left(CacheFailure()));
          return bloc;
        },
        act: (bloc) => bloc.add(GetRandomPersonEvent()),
        expect: () => [
          LoadingState(),
          const ErrorState(message: cacheFailureMessage),
        ],
      );
    });
  });
}
