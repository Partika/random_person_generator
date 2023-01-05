import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/person/person_bloc.dart';
import '../widgets/loading_widget.dart';
import '../widgets/message_display.dart';
import '../widgets/person_display.dart';

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
