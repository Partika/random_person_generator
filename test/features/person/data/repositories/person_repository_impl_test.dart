import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:tarefa_2/core/error/exceptions.dart';
import 'package:tarefa_2/core/error/failures.dart';
import 'package:tarefa_2/core/platform/network_info.dart';
import 'package:tarefa_2/features/person/data/datasources/person_local_data_source.dart';
import 'package:tarefa_2/features/person/data/datasources/person_remote_data_source.dart';
import 'package:tarefa_2/features/person/data/models/person_model.dart';
import 'package:tarefa_2/features/person/data/repositories/person_repository_impl.dart';
import 'package:tarefa_2/features/person/domain/entities/person.dart';
import './person_repository_impl_test.mocks.dart';

/*
class MockPersonRemoteDataSource extends Mock
    implements PersonRemoteDataSource {}

class MockPersonLocalDataSource extends Mock implements PersonLocalDataSource {}
*/

@GenerateMocks([NetworkInfo, PersonRemoteDataSource, PersonLocalDataSource])
void main() {
  late PersonRepositoryImpl repository;
  late MockPersonRemoteDataSource mockRemoteDataSource;
  late MockPersonLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(
    () {
      mockRemoteDataSource = MockPersonRemoteDataSource();
      mockLocalDataSource = MockPersonLocalDataSource();
      mockNetworkInfo = MockNetworkInfo();
      repository = PersonRepositoryImpl(
        remoteDataSource: mockRemoteDataSource,
        localDataSource: mockLocalDataSource,
        networkInfo: mockNetworkInfo,
      );
    },
  );

  void runTestsOnline(Function body) {
    group(
      'device is online',
      () {
        setUp(
          () {
            when(mockNetworkInfo.isConected).thenAnswer((_) async => true);
          },
        );

        body();
      },
    );
  }

  void runTestsOffline(Function body) {
    group(
      'device is offline',
      () {
        setUp(
          () {
            when(mockNetworkInfo.isConected).thenAnswer((_) async => false);
          },
        );

        body();
      },
    );
  }

  group(
    'getRandomPerson',
    () {
      const tPersonModel = PersonModel(
        nameFirst: 'Test NFirst',
        nameLast: 'Test NLast',
        locationStreet: 'Test LStreet',
        locationNumber: 123,
        locationCity: 'Test LCity',
        locationState: 'Test LState',
        locationCountry: 'Test LCountry',
        email: 'Test Email',
        dateOfBirth: 'Test DoB',
        age: 123,
        phone: 'Test Phone',
        cell: 'Test Cell',
        picture: 'Test Pic Link',
        nat: 'Test Nat',
      );
      const Person tPerson = tPersonModel;
      test(
        'should check if the device is online',
        () async {
          // arrange
          when(mockNetworkInfo.isConected).thenAnswer((_) async => true);
          when(mockRemoteDataSource.getRandomPerson())
              .thenAnswer((_) async => tPersonModel);
          // act
          repository.getRandomPerson();
          // assert
          verify(mockNetworkInfo.isConected);
        },
      );

      runTestsOnline(
        () {
          test(
            'should return remote data when the call to remote data source is successful',
            () async {
              // arrange
              when(mockRemoteDataSource.getRandomPerson())
                  .thenAnswer((_) async => tPersonModel);
              // act
              final result = await repository.getRandomPerson();
              // assert
              verify(mockRemoteDataSource.getRandomPerson());
              expect(result, equals(const Right(tPersonModel)));
            },
          );

          test(
            'should cache the data locally when the call to remote data source is successful',
            () async {
              // arrange
              when(mockRemoteDataSource.getRandomPerson())
                  .thenAnswer((_) async => tPersonModel);
              // act
              await repository.getRandomPerson();
              // assert
              verify(mockRemoteDataSource.getRandomPerson());
              verify(mockLocalDataSource.cachePerson(tPersonModel));
            },
          );

          test(
            'should return server failure when the call to remote data source is unsuccessful',
            () async {
              // arrange
              when(mockRemoteDataSource.getRandomPerson()).thenThrow(
                  ServerException('Houve um problema com o servidor!'));
              // act
              final result = await repository.getRandomPerson();
              // assert
              verify(mockRemoteDataSource.getRandomPerson());
              verifyZeroInteractions(mockLocalDataSource);
              expect(result, equals(Left(ServerFailure())));
            },
          );
        },
      );

      runTestsOffline(
        () {
          test(
            'should return last locally cached data when the cached data is present',
            () async {
              // arrange
              when(mockLocalDataSource.getlastPerson())
                  .thenAnswer((_) async => tPersonModel);
              // act
              final result = await repository.getRandomPerson();
              // assert
              verifyZeroInteractions(mockRemoteDataSource);
              verify(mockLocalDataSource.getlastPerson());
              expect(result, equals(const Right(tPerson)));
            },
          );

          test(
            'should return cache failure when there is no cached data present',
            () async {
              // arrange
              when(mockLocalDataSource.getlastPerson())
                  .thenThrow(CacheException('Cache vazia!'));
              // act
              final result = await repository.getRandomPerson();
              // assert
              verifyZeroInteractions(mockRemoteDataSource);
              verify(mockLocalDataSource.getlastPerson());
              expect(result, equals(Left(CacheFailure())));
            },
          );
        },
      );
    },
  );
}
