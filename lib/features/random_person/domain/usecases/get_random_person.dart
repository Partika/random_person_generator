import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tarefa_2/core/error/failures.dart';
import 'package:tarefa_2/core/usecases/usecase.dart';
import 'package:tarefa_2/features/random_person/domain/entities/random_person.dart';

import '../repositories/random_person_repository.dart';

class GetRandomPerson implements UseCase<RandomPerson, NoParams> {
  final RandomPersonRepository randomPersonRepository;

  GetRandomPerson(this.randomPersonRepository);

  @override
  Future<Either<Failure, RandomPerson>> call(NoParams params) async {
    return await randomPersonRepository.getRandomPerson();
  }
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
