import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tarefa_2/core/network/network_info.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'network_info_test.mocks.dart';

@GenerateMocks([InternetConnectionChecker])
void main() {
  late NetworkInfoImpl networkInfo;
  late MockInternetConnectionChecker mockInternetConnectionChecker;

  setUp(
    () {
      mockInternetConnectionChecker = MockInternetConnectionChecker();
      networkInfo = NetworkInfoImpl(mockInternetConnectionChecker);
    },
  );

  group(
    'isConnected',
    () {
      // TODO: descobrir a diferença entre:
      // Expected: <Instance of 'Future<bool>'>
      // Actual: <Instance of 'Future<bool>'>
      test(
        'should forward the call to DataConnectionChecker.hasConnection',
        () async {
          // arrange
          final tHasConnectionFuture = Future.value(true);
          when(mockInternetConnectionChecker.hasConnection)
              .thenAnswer((_) => tHasConnectionFuture);
          // act
          final result = networkInfo.isConected;
          // assert
          verify(mockInternetConnectionChecker.hasConnection);
          expect(result, tHasConnectionFuture);
        },
      );
    },
  );
}
