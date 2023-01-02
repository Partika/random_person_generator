import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tarefa_2/core/platform/network_info.dart';
import 'package:tarefa_2/features/person/data/datasources/person_local_data_source.dart';
import 'package:tarefa_2/features/person/data/datasources/person_remote_data_source.dart';
import 'package:tarefa_2/features/person/data/repositories/person_repository_impl.dart';

class MockRemoteDataSource extends Mock implements PersonRemoteDataSource {}

class MockLocalDataSource extends Mock implements PersonLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  PersonRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

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
}
