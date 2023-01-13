import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/person_repository.dart';

class DeletePerson implements UseCase<void, NoParams> {
  final PersonRepository randomPersonRepository;

  DeletePerson(this.randomPersonRepository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await randomPersonRepository.deletePerson();
  }
}
