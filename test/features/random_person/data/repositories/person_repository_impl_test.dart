import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tarefa_2/core/error/exceptions.dart';
import 'package:tarefa_2/core/platform/network_info.dart';
import 'package:tarefa_2/features/person/data/datasources/person_local_data_source.dart';
import 'package:tarefa_2/features/person/data/datasources/person_remote_data_source.dart';
import 'package:tarefa_2/features/person/data/models/person_model.dart';
import 'package:tarefa_2/features/person/data/repositories/person_repository_impl.dart';
import 'package:tarefa_2/features/person/domain/entities/person.dart';

class MockRemoteDataSource extends Mock implements PersonRemoteDataSource {}

class MockLocalDataSource extends Mock implements PersonLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late PersonRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(
    () {
      mockRemoteDataSource = MockRemoteDataSource();
      mockLocalDataSource = MockLocalDataSource();
      mockNetworkInfo = MockNetworkInfo();
      repository = PersonRepositoryImpl(
        remoteDataSource: mockRemoteDataSource,
        localDataSource: mockLocalDataSource,
        networkInfo: mockNetworkInfo,
      );
    },
  );

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

  group(
    'getRandomPerson',
    () {
      test(
        'should check if the device is online',
        () async {
          // arrange
          when(mockNetworkInfo.isConected).thenAnswer((_) async => true);
          // act
          repository.getRandomPerson();
          // assert
          verify(mockNetworkInfo.isConected);
        },
      );
    },
  );

  group(
    'device is online',
    () {
      setUp(
        () {
          when(mockNetworkInfo.isConected).thenAnswer((_) async => true);
        },
      );

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
          verifyNoMoreInteractions(mockRemoteDataSource);
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
          when(mockRemoteDataSource.getRandomPerson())
              .thenThrow(ServerException('Houve um problema com o servidor!'));
          // act
          final result = await repository.getRandomPerson();
          // assert
          verify(mockRemoteDataSource.getRandomPerson());
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(const Left(tPersonModel)));
        },
      );
    },
  );

  group(
    'device is offline',
    () {
      setUp(
        () {
          when(mockNetworkInfo.isConected).thenAnswer((_) async => false);
        },
      );

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
    },
  );
}
