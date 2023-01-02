import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
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
        final result = repository.getRandomPerson();
        // assert
        verify(mockRemoteDataSource.getRandomPerson());
        expect(result, equals(Right(tPersonModel)));
        verifyNoMoreInteractions(mockRemoteDataSource);
      });
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
    },
  );
}
