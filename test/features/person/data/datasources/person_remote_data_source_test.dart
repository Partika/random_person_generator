import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:tarefa_2/core/error/exceptions.dart';
import 'package:tarefa_2/features/person/data/datasources/person_remote_data_source.dart';
import 'package:tarefa_2/features/person/data/models/person_model.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'person_remote_data_source_test.mocks.dart';

@GenerateMocks([Dio, http.Client])
void main() {
  late PersonRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = PersonRemoteDataSourceImpl(client: mockHttpClient);
  });

  void setUpMockHttpClientSucces200() {
    when(mockHttpClient.get(any))
        .thenAnswer((_) async => http.Response(fixture('person.json'), 200));
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(any))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
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
        verify(mockHttpClient
            .get(Uri(scheme: 'https', host: 'randomuser.me', path: '/api/')));
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
