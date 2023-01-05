import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarefa_2/features/person/domain/entities/person.dart';
import 'package:tarefa_2/features/person/presentation/bloc/person/person_bloc.dart';
import 'package:tarefa_2/injection_container.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pessoa Aleatoria'),
      ),
      body: buildBody(context),
    );
  }

  BlocProvider<PersonBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PersonBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10.0),
              BlocBuilder<PersonBloc, PersonState>(
                builder: (context, state) {
                  if (state is EmptyState) {
                    return const MessageDisplay(message: 'Nenhuma Pessoa!');
                  } else if (state is LoadingState) {
                    return const LoadingWidget();
                  } else if (state is LoadedState) {
                    return PersonDisplay(person: state.person);
                  } else if (state is ErrorState) {
                    return MessageDisplay(message: state.message);
                  } else {
                    return const Text('Algo deu muito errado!');
                  }
                },
              ),
              const SizedBox(height: 20.0),
              Column(
                children: <Widget>[
                  const Placeholder(
                    fallbackHeight: 40,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const <Widget>[
                      Expanded(
                        child: Placeholder(fallbackHeight: 30),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Placeholder(fallbackHeight: 30),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MessageDisplay extends StatelessWidget {
  final String message;
  const MessageDisplay({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            message,
            style: const TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: const CircularProgressIndicator(),
    );
  }
}

class PersonDisplay extends StatelessWidget {
  final Person person;
  const PersonDisplay({
    Key? key,
    required this.person,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Expanded(
        child: Column(
          children: <Widget>[
            Text(
              person.nameFirst + ' ' + person.nameLast,
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            SingleChildScrollView(
              child: Text(
                // TODO: resto das informacoes
                person.phone,
                style: const TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
