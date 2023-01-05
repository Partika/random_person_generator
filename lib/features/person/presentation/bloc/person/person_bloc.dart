import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tarefa_2/core/error/failures.dart';
import 'package:tarefa_2/core/usecases/usecase.dart';
import 'package:tarefa_2/features/person/domain/entities/person.dart';
import 'package:tarefa_2/features/person/domain/usecases/get_random_person.dart';

part 'person_event.dart';
part 'person_state.dart';

const String serverFailureMessage = 'Server Failure';
const String cacheFailureMessage = 'Cache Failure';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final GetRandomPerson getRandomPerson;

  PersonBloc({required GetRandomPerson random})
      : getRandomPerson = random,
        super(EmptyState()) {
    on<PersonEvent>((event, emit) async {
      if (event is GetRandomPersonEvent) {
        emit(LoadingState());
        final failureOrPerson = await getRandomPerson(NoParams());
        failureOrPerson.fold(
          (failure) => emit(ErrorState(message: _mapFailureToMessage(failure))),
          (person) => emit(LoadedState(person: person)),
        );
      }
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return 'Unexpected error';
    }
  }
}
