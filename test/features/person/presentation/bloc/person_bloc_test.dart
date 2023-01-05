import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tarefa_2/core/error/failures.dart';
import 'package:tarefa_2/core/usecases/usecase.dart';
import 'package:tarefa_2/features/person/domain/entities/person.dart';
import 'package:tarefa_2/features/person/domain/usecases/get_random_person.dart';
import 'package:tarefa_2/features/person/presentation/bloc/person/person_bloc.dart';

import 'person_bloc_test.mocks.dart';

@GenerateMocks([GetRandomPerson])
void main() {
  late PersonBloc bloc;
  late MockGetRandomPerson mockGetRandomPerson;

  setUp(() {
    mockGetRandomPerson = MockGetRandomPerson();
    bloc = PersonBloc(random: mockGetRandomPerson);
  });

  blocTest(
    'emits [EmptyState] when initial state.',
    build: () => bloc,
    act: (bloc) => bloc.add(MyEvent),
    expect: () => const <SubjectState>[MyState],
  );

  test('initial state should be EmptyState', () {
    // assert
    expect(bloc.state, equals(EmptyState()));
  });

  group('GetRandomPersonEvent', () {
    const tPerson = Person(
      nameFirst: 'nameFirst',
      nameLast: 'nameLast',
      locationStreet: 'locationStreet',
      locationNumber: 123,
      locationCity: 'locationCity',
      locationState: 'locationState',
      locationCountry: 'locationCountry',
      email: 'email',
      dateOfBirth: 'dateOfBirth',
      age: 123,
      phone: 'phone',
      cell: 'cell',
      picture: 'picture',
      nat: 'nat',
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

    test(
      'should emit [LoadingEvent, LoadedEvent] when data is gotten successfully',
      () async {
        // arrange
        when(mockGetRandomPerson(any))
            .thenAnswer((_) async => const Right(tPerson));
        // assert later
        final expected = [
          EmptyState(),
          LoadingState(),
          const LoadedState(person: tPerson),
        ];
        expectLater(bloc.state, emitsInOrder(expected));
        // act
        bloc.add(GetRandomPersonEvent());
      },
    );

    group('Failures', () {
      test(
        'should emit [LoadingEvent, ErrorEvent] when getting data fails',
        () async {
          // arrange
          when(mockGetRandomPerson(any))
              .thenAnswer((_) async => Left(ServerFailure()));
          // assert later
          final expected = [
            EmptyState(),
            LoadingState(),
            const ErrorState(message: serverFailureMessage),
          ];
          expectLater(bloc.state, emitsInOrder(expected));
          // act
          bloc.add(GetRandomPersonEvent());
        },
      );

      test(
        'should emit [LoadingEvent, ErrorEvent] whit proper message for the error when getting data fails',
        () async {
          // arrange
          when(mockGetRandomPerson(any))
              .thenAnswer((_) async => Left(CacheFailure()));
          // assert later
          final expected = [
            EmptyState(),
            LoadingState(),
            const ErrorState(message: cacheFailureMessage),
          ];
          expectLater(bloc.state, emitsInOrder(expected));
          // act
          bloc.add(GetRandomPersonEvent());
        },
      );
    });
  });
}
