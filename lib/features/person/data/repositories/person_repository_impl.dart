import 'package:dartz/dartz.dart';
import 'package:tarefa_2/core/platform/network_info.dart';
import 'package:tarefa_2/features/person/data/datasources/person_local_data_source.dart';
import 'package:tarefa_2/features/person/data/datasources/person_remote_data_source.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/person.dart';
import '../../domain/repositories/person_repository.dart';

class PersonRepositoryImpl implements PersonRepository {
  final PersonRemoteDataSource remoteDataSource;
  final PersonLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PersonRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

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
