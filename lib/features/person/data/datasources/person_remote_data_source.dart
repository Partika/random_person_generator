import 'package:tarefa_2/features/person/data/models/person_model.dart';

abstract class PersonRemoteDataSource {
  /// Calls the http://randomuser.me/api/ endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<PersonModel> getRandomPerson();

  /// Deletes the Person generated by the API.
  deletePerson();
}
