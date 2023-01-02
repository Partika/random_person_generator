import 'package:tarefa_2/features/person/domain/entities/person.dart';

class PersonModel extends Person {
  const PersonModel({
    required nameFirst,
    required nameLast,
    required locationStreet,
    required locationNumber,
    required locationCity,
    required locationState,
    required locationCountry,
    required email,
    required loginUser,
    required loginPassword,
    required dateOfBirth,
    required age,
    required phone,
    required cell,
    required picture,
    required nat,
  }) : super(
          nameFirst: nameFirst,
          nameLast: nameLast,
          locationStreet: locationStreet,
          locationNumber: locationNumber,
          locationCity: locationCity,
          locationState: locationState,
          locationCountry: locationCountry,
          email: email,
          loginUser: loginUser,
          loginPassword: loginPassword,
          dateOfBirth: dateOfBirth,
          age: age,
          phone: phone,
          cell: cell,
          picture: picture,
          nat: nat,
        );
}
