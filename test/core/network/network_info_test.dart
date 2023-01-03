// import 'package:mockito/annotations.dart';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
import 'package:tarefa_2/core/network/network_info.dart';

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
