// Mocks generated by Mockito 5.2.0 from annotations
// in tarefa_2/test/features/person/domain/usecases/get_random_person_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:tarefa_2/core/error/failures.dart' as _i5;
import 'package:tarefa_2/features/person/domain/entities/person.dart' as _i6;
import 'package:tarefa_2/features/person/domain/repositories/person_repository.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [PersonRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPersonRepository extends _i1.Mock implements _i3.PersonRepository {
  MockPersonRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Person>> getRandomPerson() =>
      (super.noSuchMethod(Invocation.method(#getRandomPerson, []),
              returnValue: Future<_i2.Either<_i5.Failure, _i6.Person>>.value(
                  _FakeEither_0<_i5.Failure, _i6.Person>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.Person>>);
  @override
  void deletePerson() =>
      super.noSuchMethod(Invocation.method(#deletePerson, []),
          returnValueForMissingStub: null);
}