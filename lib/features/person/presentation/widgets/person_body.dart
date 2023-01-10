import 'package:flutter/material.dart';

import '../../domain/entities/person.dart';

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
