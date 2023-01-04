import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tarefa_2/features/person/domain/entities/person.dart';
import 'package:tarefa_2/features/person/domain/usecases/get_random_person.dart';

part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final GetRandomPerson getRandomPerson;

  PersonBloc({required GetRandomPerson random})
      : getRandomPerson = random,
        super(EmptyState()) {
    on<PersonEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
