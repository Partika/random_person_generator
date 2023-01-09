import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../domain/entities/person.dart';
import '../bloc/person/person_bloc.dart';
import '../widgets/widgets.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: buildBody(context)),
    );
  }

  Widget buildBody(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFF9800F4),
                Color(0xFF5E138C),
              ]),
            ),
            child: const Text('Gradiente'),
          ),
          Padding(
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
                const PersonControls(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
