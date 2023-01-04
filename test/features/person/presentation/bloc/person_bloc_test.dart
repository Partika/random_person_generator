import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tarefa_2/features/person/domain/usecases/get_random_person.dart';
import 'package:tarefa_2/features/person/presentation/bloc/person/person_bloc.dart';

import 'person_bloc_test.mocks.dart';

@GenerateMocks([GetRandomPerson])
void main() {
  late PersonBloc bloc;
  late MockGetRandomPerson mockGetRandomPerson;

  setUp(() {
    mockGetRandomPerson = MockGetRandomPerson();
    bloc = PersonBloc(random: mockGetRandomPerson);
  });

  test('initial state should be EmptyState', () {
    // assert
    expect(bloc.state, equals(EmptyState()));
  });

  group('bloc group', () {
    test('should do something', () {
      // arrange
      // act
      // assert
    });
  });
}
