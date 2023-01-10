import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/person/person_bloc.dart';

class PersonControls extends StatelessWidget {
  const PersonControls({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: const Color(0xFFFD6F6F),
      onPressed: () => deletePerson(context),
      icon: const Icon(Icons.delete),
      label: const Text('DELETE ACCOUNT'),
    );
  }

  void deletePerson(BuildContext context) {
    BlocProvider.of<PersonBloc>(context).add(DeletePersonEvent());
  }
}
