import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/person.dart';
import '../../domain/repositories/person_repository.dart';
import '../datasources/person_local_data_source.dart';
import '../datasources/person_remote_data_source.dart';

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
  Future<void> deletePerson() {
    return localDataSource.deletePerson();
  }

  @override
  Future<Either<Failure, Person>> getRandomPerson() async {
    if (await networkInfo.isConected) {
      try {
        final remotePerson = await remoteDataSource.getRandomPerson();
        localDataSource.cachePerson(remotePerson);
        return Right(remotePerson);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPerson = await localDataSource.getlastPerson();
        return Right(localPerson);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
