import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/person/person_bloc.dart';

class PersonControls extends StatelessWidget {
  const PersonControls({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ElevatedButton(
          onPressed: () => addRandom(context),
          child: const Text('Nova Pessoa'),
        ),
      ],
    );
  }

  void addRandom(BuildContext context) {
    BlocProvider.of<PersonBloc>(context).add(GetRandomPersonEvent());
  }
}