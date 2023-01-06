import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:random_person_generator/core/error/exceptions.dart';
import 'package:random_person_generator/features/person/data/datasources/person_local_data_source.dart';
import 'package:random_person_generator/features/person/data/models/person_model.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'person_local_data_source_test.mocks.dart';

//class MockSharedPreferences extends Mock implements SharedPreferences {}

@GenerateMocks([SharedPreferences])
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

  group(
    'cachePerson',
    () {
      const tPersonModel = PersonModel(
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
        'should call SharedPreferences to cache the data',
        () async {
          final expectedJsonString = jsonEncode(tPersonModel.toJson());
          when(mockSharedPreferences.setString(
                  cachedPerson, expectedJsonString))
              .thenAnswer((_) async => true);
          // act
          dataSource.cachePerson(tPersonModel);
          // assert
          verify(mockSharedPreferences.setString(
            cachedPerson,
            expectedJsonString,
          ));
        },
      );
    },
  );
}
