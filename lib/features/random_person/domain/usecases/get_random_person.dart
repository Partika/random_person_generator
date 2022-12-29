import 'package:dartz/dartz.dart';
import 'package:tarefa_2/core/error/failures.dart';
import 'package:tarefa_2/features/random_person/domain/entities/random_person.dart';

import '../repositories/random_person_repository.dart';

class GetRandomPerson {
  final RandomPersonRepository randomPersonRepository;

  GetRandomPerson(this.randomPersonRepository);

  Future<Either<Failure, RandomPerson>> execute(String? seed) async {
    return await randomPersonRepository.getRandomPerson(seed);
  }
}
