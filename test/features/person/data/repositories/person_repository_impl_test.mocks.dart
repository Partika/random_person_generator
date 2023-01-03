// Mocks generated by Mockito 5.2.0 from annotations
// in tarefa_2/test/features/person/data/repositories/person_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:tarefa_2/core/platform/network_info.dart' as _i3;
import 'package:tarefa_2/features/person/data/datasources/person_local_data_source.dart'
    as _i6;
import 'package:tarefa_2/features/person/data/datasources/person_remote_data_source.dart'
    as _i5;
import 'package:tarefa_2/features/person/data/models/person_model.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakePersonModel_0 extends _i1.Fake implements _i2.PersonModel {}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i3.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<bool> get isConected =>
      (super.noSuchMethod(Invocation.getter(#isConected),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
}

/// A class which mocks [PersonRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockPersonRemoteDataSource extends _i1.Mock
    implements _i5.PersonRemoteDataSource {
  MockPersonRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.PersonModel> getRandomPerson() =>
      (super.noSuchMethod(Invocation.method(#getRandomPerson, []),
              returnValue: Future<_i2.PersonModel>.value(_FakePersonModel_0()))
          as _i4.Future<_i2.PersonModel>);
}

/// A class which mocks [PersonLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockPersonLocalDataSource extends _i1.Mock
    implements _i6.PersonLocalDataSource {
  MockPersonLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.PersonModel> getlastPerson() =>
      (super.noSuchMethod(Invocation.method(#getlastPerson, []),
              returnValue: Future<_i2.PersonModel>.value(_FakePersonModel_0()))
          as _i4.Future<_i2.PersonModel>);
  @override
  _i4.Future<void> cachePerson(_i2.PersonModel? personToCache) =>
      (super.noSuchMethod(Invocation.method(#cachePerson, [personToCache]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
}