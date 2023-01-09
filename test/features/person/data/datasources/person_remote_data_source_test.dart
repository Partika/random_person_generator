import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:random_person_generator/core/error/exceptions.dart';
import 'package:random_person_generator/features/person/data/datasources/person_remote_data_source.dart';
import 'package:random_person_generator/features/person/data/models/person_model.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'person_remote_data_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late PersonRemoteDataSourceImpl dataSource;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    dataSource = PersonRemoteDataSourceImpl(dio: mockDio);
  });

  void setUpMockHttpClientSucces200() {
    when(mockDio.get(any)).thenAnswer((_) async => Response(
        data: jsonDecode(fixture('person.json')),
        requestOptions: RequestOptions(path: ''),
        statusCode: 200));
  }

  void setUpMockHttpClientFailure404() {
    when(mockDio.get(any)).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(path: ''),
        statusCode: 404,
        statusMessage: 'Something went wrong'));
  }

  group('getRandomPerson', () {
    final tPersonModel =
        PersonModel.fromJson(jsonDecode(fixture('person.json')));
    test(
      'should perform a GET request on a URL',
      () async {
        // arrange
        setUpMockHttpClientSucces200();
        // act
        dataSource.getRandomPerson();
        // assert
        verify(mockDio.get('https://randomuser.me/api/'));
      },
    );
    test(
      'should return person when the response code is 200 (seccess)',
      () async {
        // arrange
        setUpMockHttpClientSucces200();
        // act
        final result = await dataSource.getRandomPerson();
        // assert
        expect(result, equals(tPersonModel));
      },
    );
    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource.getRandomPerson;
        // assert
        expect(() => call(), throwsA(const TypeMatcher<ServerException>()));
      },
    );
  });
}
