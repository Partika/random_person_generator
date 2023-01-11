import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/person.dart';

abstract class PersonRepository {
  Future<Either<Failure, Person>> getRandomPerson();
  Future<void> deletePerson();
}
