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
      nameFirst: json['results'][0]['name']['first'],
      nameLast: json['results'][0]['name']['last'],
      locationStreet: json['results'][0]['location']['street']['name'],
      locationNumber: json['results'][0]['location']['street']['number'],
      locationCity: json['results'][0]['location']['city'],
      locationState: json['results'][0]['location']['state'],
      locationCountry: json['results'][0]['location']['country'],
      email: json['results'][0]['email'],
      dateOfBirth: json['results'][0]['dob']['date'],
      age: json['results'][0]['dob']['age'],
      phone: json['results'][0]['phone'],
      cell: json['results'][0]['cell'],
      picture: json['results'][0]['picture']['medium'],
      nat: json['results'][0]['nat'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': {'first': nameFirst, 'last': nameLast},
      'location': {
        'street': {'name': locationStreet, 'number': locationNumber},
        'city': locationCity,
        'state': locationState,
        'country': locationCountry
      },
      'email': email,
      'dob': {'date': dateOfBirth, 'age': age},
      'phone': phone,
      'cell': cell,
      'picture': picture,
      'nat': nat
    };
  }
}
