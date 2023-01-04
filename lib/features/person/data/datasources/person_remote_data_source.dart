import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tarefa_2/core/error/exceptions.dart';

import 'package:tarefa_2/features/person/data/models/person_model.dart';

abstract class PersonRemoteDataSource {
  /// Calls the http://randomuser.me/api/ endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<PersonModel> getRandomPerson();
}

class PersonRemoteDataSourceImpl implements PersonRemoteDataSource {
  final http.Client client;
  final url = Uri(scheme: 'https', host: 'randomuser.me', path: '/api/');

  PersonRemoteDataSourceImpl({required this.client});

  @override
  Future<PersonModel> getRandomPerson() async {
    final response = await client.get(url);
    if (response.statusCode == 200) {
      return PersonModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException('Something went wrong');
    }
  }
}
