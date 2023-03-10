import 'package:flutter/material.dart';
import 'package:random_person_generator/features/person/domain/entities/person.dart';

class FullCache extends StatelessWidget {
  final Person person;
  const FullCache({
    Key? key,
    required this.person,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox.fromSize(
            size: const Size.fromRadius(60),
            child: Image.network(person.picture),
          ),
        ),
        const Padding(padding: EdgeInsets.only(left: 20)),
        SizedBox(
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'USERNAME:',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF6C6C6C),
                ),
              ),
              Text(
                person.username.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              const Text(
                'Email:',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF6C6C6C),
                ),
              ),
              Text(
                person.email.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
