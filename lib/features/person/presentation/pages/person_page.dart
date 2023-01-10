import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_person_generator/features/person/domain/entities/person.dart';

import '../bloc/person/person_bloc.dart';
import '../widgets/widgets.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color(0xFF8200D1),
          onTap: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          currentIndex: currentPageIndex,
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
        ),
        body: const <Widget>[
          PersonInfo(),
          PersonLocation(),
        ][currentPageIndex]);
  }
}

class PersonLocation extends StatelessWidget {
  const PersonLocation({
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
              LocationBody(person: state.person),
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

class LocationBody extends StatelessWidget {
  final Person person;
  const LocationBody({
    Key? key,
    required this.person,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      alignment: Alignment.topLeft,
      decoration: const BoxDecoration(
        color: Color(0xFFFFFDD4),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            offset: Offset(0, 5),
            color: Color(0x88000000),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'ADRESS:',
              style: fieldNameStyle,
            ),
            Text(
              (person.locationStreet +
                      ', Nº ${person.locationNumber}, ' +
                      person.locationCity)
                  .toUpperCase(),
              style: fieldContentStyle,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: FloatingActionButton.extended(
                  backgroundColor: const Color(0xFF9800F4),
                  onPressed: () {},
                  icon: const Icon(Icons.map_sharp),
                  label: const Text('OPEN ON MAP'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

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
