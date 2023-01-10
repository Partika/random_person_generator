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
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.topLeft,
      decoration: const BoxDecoration(
        color: Color(0xFFFFFDD4),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [BoxShadow(blurRadius: 10)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'NAME:',
            style: fieldNameStyle,
          ),
          Text(
            person.nameFirst + ' ' + person.nameLast,
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
                    person.dateOfBirth,
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
            person.email,
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
      child: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top: 20)),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(60),
                  child: Image.network(person.picture),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                person.username + ', ${person.age}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                person.email,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
