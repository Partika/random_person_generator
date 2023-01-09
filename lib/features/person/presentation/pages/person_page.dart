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
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.topLeft,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFF9800F4),
                  Color(0xFF5E138C),
                ]),
                borderRadius: BorderRadius.all(Radius.circular(20)),
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
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
          ],
        );
      },
    );
  }
}
