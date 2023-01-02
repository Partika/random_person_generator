import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/person.dart';
import '../../domain/repositories/person_repository.dart';

class PersonRepositoryImplementation implements PersonRepository {
  @override
  void deletePerson() {
    // TODO: implement deleteRandomPerson
  }

  @override
  Future<Either<Failure, Person>> getRandomPerson() {
    // TODO: implement getRandomPerson
    throw UnimplementedError();
  }
}
