import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/random_person.dart';

abstract class RandomPersonRepository {
  Future<Either<Failure, RandomPerson>> getRandomPerson();
  void deleteRandomPerson();
}
