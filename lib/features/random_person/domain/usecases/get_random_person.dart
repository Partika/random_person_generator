import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/random_person.dart';
import '../repositories/random_person_repository.dart';

class GetRandomPerson implements UseCase<RandomPerson, NoParams> {
  final RandomPersonRepository randomPersonRepository;

  GetRandomPerson(this.randomPersonRepository);

  @override
  Future<Either<Failure, RandomPerson>> call(NoParams params) async {
    return await randomPersonRepository.getRandomPerson();
  }
}
