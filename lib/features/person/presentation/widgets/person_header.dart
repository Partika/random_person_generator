import 'package:flutter/material.dart';

import '../../domain/entities/person.dart';

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
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        boxShadow: [BoxShadow(blurRadius: 10)],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          bottom: MediaQuery.of(context).size.height * 0.015,
          top: MediaQuery.of(context).size.height * 0.06,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox.fromSize(
                size: const Size.fromRadius(60),
                child: Image.network(person.picture),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.0125)),
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
