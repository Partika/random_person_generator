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
            ],
          );
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}

const TextStyle fieldNameStyle = TextStyle(
  fontSize: 12,
  color: Color(0xFF6C6C6C),
  fontWeight: FontWeight.bold,
);
const TextStyle fieldContentStyle = TextStyle(
  fontSize: 16,
  color: Color(0xFF000000),
  fontWeight: FontWeight.bold,
);

class PersonBody extends StatelessWidget {
  final Person person;
  const PersonBody({
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
        boxShadow: [BoxShadow(blurRadius: 10)],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'NAME:',
              style: fieldNameStyle,
            ),
            Text(
              (person.nameFirst + ' ' + person.nameLast).toUpperCase(),
              style: fieldContentStyle,
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Row(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Text>[
                    const Text(
                      'AGE:',
                      style: fieldNameStyle,
                    ),
                    Text(
                      '${person.age} YEARS',
                      style: fieldContentStyle,
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(left: 100)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Text>[
                    const Text(
                      'BIRTH DATE:',
                      style: fieldNameStyle,
                    ),
                    Text(
                      (person.dateOfBirth.substring(8, 10) +
                          '/' +
                          person.dateOfBirth.substring(5, 7) +
                          '/' +
                          person.dateOfBirth.substring(0, 4)),
                      style: fieldContentStyle,
                    ),
                  ],
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            const Text(
              'EMAIL:',
              style: fieldNameStyle,
            ),
            Text(
              person.email.toUpperCase(),
              style: fieldContentStyle,
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Row(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Text>[
                    const Text(
                      'PHONE:',
                      style: fieldNameStyle,
                    ),
                    Text(
                      person.phone,
                      style: fieldContentStyle,
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(left: 100)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Text>[
                    const Text(
                      'CELL:',
                      style: fieldNameStyle,
                    ),
                    Text(
                      person.cell,
                      style: fieldContentStyle,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PersonHeader extends StatelessWidget {
  final Person person;
  const PersonHeader({
    Key? key,
    required this.person,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.topLeft,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFF9800F4),
          Color(0xFF5E138C),
        ]),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [BoxShadow(blurRadius: 10)],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IconButton(
              // TODO: tem que ir pra esquerda
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.white,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox.fromSize(
                size: const Size.fromRadius(60),
                child: Image.network(person.picture),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10.0)),
            Text(
              person.username.toUpperCase() + ', ${person.age}',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              person.email,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
