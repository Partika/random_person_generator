import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      child: Column(
        children: <Widget>[
          const SizedBox(height: 10.0),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: const Placeholder(),
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
                  Expanded(child: Placeholder(fallbackHeight: 30)),
                  Expanded(child: Placeholder(fallbackHeight: 30)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
