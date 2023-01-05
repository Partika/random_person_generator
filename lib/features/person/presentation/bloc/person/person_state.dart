part of 'person_bloc.dart';

abstract class PersonState extends Equatable {
  const PersonState();

  @override
  List<Object> get props => [];
}

class EmptyState extends PersonState {}

class LoadingState extends PersonState {}

class LoadedState extends PersonState {
  final Person person;

  const LoadedState({required this.person});

  @override
  List<Object> get props => [person];
}

class ErrorState extends PersonState {
  final String message;

  const ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
