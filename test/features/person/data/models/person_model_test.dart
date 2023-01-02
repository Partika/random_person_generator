import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tarefa_2/features/person/data/models/person_model.dart';
import 'package:tarefa_2/features/person/domain/entities/person.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tPersonModel = PersonModel(
    nameFirst: 'Test FName',
    nameLast: 'Test LName',
    locationStreet: 'Test Street',
    locationNumber: 123,
    locationCity: 'Test City',
    locationState: 'Test State',
    locationCountry: 'Test Country',
    email: 'Test Email',
    dateOfBirth: 'Test DoB',
    age: 123,
    phone: 'Test Phone',
    cell: 'Test Cell',
    picture: 'Test Pic Link',
    nat: 'Test Nat',
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
              'state': 'Test State',
              'country': 'Test Country'
            },
            'email': 'Test Email',
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
