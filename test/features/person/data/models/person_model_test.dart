import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:random_person_generator/features/person/data/models/person_model.dart';
import 'package:random_person_generator/features/person/domain/entities/person.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tPersonModel = PersonModel(
    nameFirst: 'Test FName',
    nameLast: 'Test LName',
    locationStreet: 'Test Street',
    locationNumber: 123,
    locationCity: 'Test City',
    locationLongitude: '123',
    locationLatitude: '123',
    email: 'Test Email',
    username: 'Test Username',
    dateOfBirth: 'Test DoB',
    age: 123,
    phone: 'Test Phone',
    cell: 'Test Cell',
    picture: 'Test Pic Link',
  );

  test(
    'should be a subclass of Person entity',
    () async {
      expect(tPersonModel, isA<Person>());
    },
  );

  group(
    'fromJson',
    () {
      test(
        'should return valid model when reading the JSON',
        () async {
          // arrange
          final Map<String, dynamic> jsonMap =
              jsonDecode(fixture('person.json'));
          // act
          final result = PersonModel.fromJson(jsonMap);
          // assert
          expect(result, tPersonModel);
        },
      );
    },
  );

  group(
    'toJson',
    () {
      test(
        'should return a JSON map containing the proper data',
        () async {
          // act
          final result = tPersonModel.toJson();
          // assert
          final expectedMap = {
            'name': {'first': 'Test FName', 'last': 'Test LName'},
            'location': {
              'street': {'name': 'Test Street', 'number': 123},
              'city': 'Test City',
              'coordinates': {'latitude': '123', 'longitude': '123'}
            },
            'email': 'Test Email',
            'login': {'username': 'Test Username'},
            'dob': {'date': 'Test DoB', 'age': 123},
            'phone': 'Test Phone',
            'cell': 'Test Cell',
            'picture': 'Test Pic Link',
            'nat': 'Test Nat'
          };
          expect(result, expectedMap);
        },
      );
    },
  );
}
