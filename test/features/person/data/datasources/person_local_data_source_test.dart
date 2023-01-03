import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tarefa_2/core/error/exceptions.dart';
import 'package:tarefa_2/features/person/data/datasources/person_local_data_source.dart';
import 'package:tarefa_2/features/person/data/models/person_model.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late PersonLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(
    () {
      mockSharedPreferences = MockSharedPreferences();
      dataSource =
          PersonLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
    },
  );

  group(
    'getLastPerson',
    () {
      final tPersonModel =
          PersonModel.fromJson(jsonDecode(fixture('person_cached.json')));
      test(
        'should return Person from SharedPreferences when there is one in the cache',
        () async {
          // arrange
          when(mockSharedPreferences.getString(cachedPerson))
              .thenReturn(fixture('person_cached.json'));
          // act
          final result = await dataSource.getlastPerson();
          // assert
          verify(mockSharedPreferences.getString(cachedPerson));
          expect(result, equals(tPersonModel));
        },
      );

      test(
        'should throw a CacheException when there is not a cached value',
        () async {
          // arrange
          when(mockSharedPreferences.getString(cachedPerson)).thenReturn(null);
          // act
          final call = dataSource.getlastPerson;
          // assert
          expect(() => call(), throwsA(const TypeMatcher<CacheException>()));
        },
      );
    },
  );
}
