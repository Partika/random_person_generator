import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/person/person_bloc.dart';

class PersonControls extends StatelessWidget {
  const PersonControls({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFFFD6F6F),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          fixedSize: Size(MediaQuery.of(context).size.width / 2, 43),
        ),
        onPressed: () => deletePerson(context),
        child: Row(
          children: const <Widget>[
            Icon(Icons.delete),
            Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: Text('DELETE ACCOUNT'),
            ),
          ],
        ),
      ),
    );
  }

  void deletePerson(BuildContext context) {
    BlocProvider.of<PersonBloc>(context).add(DeletePersonEvent());
    Navigator.pop(context);
  }
}
