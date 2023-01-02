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
          dateOfBirth: dateOfBirth,
          age: age,
          phone: phone,
          cell: cell,
          picture: picture,
          nat: nat,
        );

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      nameFirst: json['results']['name']['first'],
      nameLast: json['results']['name']['last'],
      locationStreet: json['results']['location']['street']['name'],
      locationNumber: json['results']['location']['street']['number'],
      locationCity: json['results']['location']['city'],
      locationState: json['results']['location']['state'],
      locationCountry: json['results']['location']['country'],
      email: json['results']['email'],
      dateOfBirth: json['results']['dob']['date'],
      age: json['results']['dob']['age'],
      phone: json['results']['phone'],
      cell: json['results']['cell'],
      picture: json['results']['picutre']['medium'],
      nat: json['results']['nat'],
    );
  }
}
