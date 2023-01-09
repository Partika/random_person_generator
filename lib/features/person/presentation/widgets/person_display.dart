import 'package:flutter/material.dart';

import '../../domain/entities/person.dart';

class PersonDisplay extends StatelessWidget {
  final Person person;
  const PersonDisplay({
    Key? key,
    required this.person,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        children: <Widget>[
          Text(
            person.nameFirst + ' ' + person.nameLast,
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          SingleChildScrollView(
            child: Text(
              // TODO: resto das informacoes
              person.phone,
              style: const TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
