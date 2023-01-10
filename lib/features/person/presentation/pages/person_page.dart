import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              const Padding(
                padding: EdgeInsets.all(10),
              ),
              BottomNavigationBar(
                selectedItemColor: const Color(0xFF8200D1),
                onTap: (int num) => {},
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.account_box_outlined),
                    label: 'INFO',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.map_sharp),
                    label: 'LOCATION',
                  ),
                ],
              )
            ],
          );
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}
