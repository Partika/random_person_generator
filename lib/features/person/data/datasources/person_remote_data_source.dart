import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tarefa_2/core/error/exceptions.dart';

import 'package:tarefa_2/features/person/data/models/person_model.dart';

abstract class PersonRemoteDataSource {
  /// Calls the http://randomuser.me/api/ endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<PersonModel> getRandomPerson();
}

class PersonRemoteDataSourceImpl implements PersonRemoteDataSource {
  final Dio dio;

  PersonRemoteDataSourceImpl({required this.dio});

  @override
  Future<PersonModel> getRandomPerson() async {
    var response = await dio.get('https://randomuser.me/api/');
    if (response.statusCode == 200) {
      return PersonModel.fromJson(response.data);
    } else {
      throw ServerException('Something went wrong');
    }
  }
}
