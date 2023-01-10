import 'package:dartz/dartz.dart';
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
    return BlocBuilder<PersonBloc, PersonState>(
      builder: (context, state) {
        return Column(
          children: const <Widget>[
            PersonHeader(),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            PersonBody(),
          ],
        );
      },
    );
  }
}

class PersonBody extends StatelessWidget {
  const PersonBody({
    Key? key,
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
          Text('NAME:'),
          Text('NAME'),
          Padding(padding: EdgeInsets.only(top: 10)),
          Row(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Text>[
                  Text('AGE:'),
                  Text('AGE YEARS'),
                ],
              ),
              Padding(padding: EdgeInsets.only(left: 100)),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Text>[
                  Text('BIRTH DATE:'),
                  Text('BIRTH DATE'),
                ],
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text('EMAIL:'),
          Text('EMAIL'),
          Padding(padding: EdgeInsets.only(top: 10)),
          Row(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Text>[
                  Text('PHONE:'),
                  Text('PHONE'),
                ],
              ),
              Padding(padding: EdgeInsets.only(left: 100)),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Text>[
                  Text('CELL:'),
                  Text('CELL'),
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
  const PersonHeader({
    Key? key,
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
                  child: const Placeholder(),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'USERNAME, AGE',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'email',
                style: TextStyle(
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
