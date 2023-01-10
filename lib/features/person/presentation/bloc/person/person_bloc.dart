import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:random_person_generator/features/person/domain/usecases/delete_person.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../domain/entities/person.dart';
import '../../../domain/usecases/get_random_person.dart';

part 'person_event.dart';
part 'person_state.dart';

const String serverFailureMessage = 'Server Failure';
const String cacheFailureMessage = 'Cache Failure';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final GetRandomPerson getRandomPerson;
  final DeletePerson deletePerson;

  PersonBloc({
    required GetRandomPerson random,
    required DeletePerson delete,
  })  : getRandomPerson = random,
        deletePerson = delete,
        super(EmptyState()) {
    on<PersonEvent>((event, emit) async {
      if (event is GetRandomPersonEvent) {
        emit(LoadingState());
        final failureOrPerson = await getRandomPerson(NoParams());
        return failureOrPerson.fold(
          (failure) => emit(ErrorState(message: _mapFailureToMessage(failure))),
          (person) => emit(LoadedState(person: person)),
        );
      }
      if (event is DeletePersonEvent) {
        await deletePerson(NoParams());
        emit(EmptyState());
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
