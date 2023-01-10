import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/person/person_bloc.dart';
import 'widgets.dart';

class PersonInfo extends StatelessWidget {
  const PersonInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonBloc, PersonState>(
      builder: (context, state) {
        if (state is LoadedState) {
          return Column(
            children: <Widget>[
              PersonHeader(
                person: state.person,
              ),
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              PersonBody(
                person: state.person,
              ),
              const Padding(
                padding: EdgeInsets.all(80),
              ),
              const PersonControls(),
            ],
          );
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}
