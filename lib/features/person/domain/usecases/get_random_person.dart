import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/person.dart';
import '../repositories/person_repository.dart';

class GetRandomPerson implements UseCase<Person, NoParams> {
  final PersonRepository randomPersonRepository;

  GetRandomPerson(this.randomPersonRepository);

  @override
  Future<Either<Failure, Person>> call(NoParams params) async {
    return await randomPersonRepository.getRandomPerson();
  }
}
