import 'package:flutter_test/flutter_test.dart';
import 'package:tarefa_2/core/network/network_info.dart';
// import 'package:mockito/mockito.dart';

//@GenerateMocks([InternetAddress])
void main() {
  late NetworkInfoImpl networkInfo;

  setUp(
    () {
      networkInfo = NetworkInfoImpl();
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
          // act
          final result = networkInfo.isConected;
          // assert
          expect(result, tHasConnectionFuture);
        },
      );
    },
  );
}
