import 'package:dartz/dartz.dart';
import 'package:tarefa_2/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
