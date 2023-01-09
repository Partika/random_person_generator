import '../../domain/entities/person.dart';

class PersonModel extends Person {
  const PersonModel({
    required nameFirst,
    required nameLast,
    required locationStreet,
    required locationNumber,
    required locationCity,
    required locationLatitude,
    required locationLongitude,
    required email,
    required username,
    required dateOfBirth,
    required age,
    required phone,
    required cell,
    required picture,
  }) : super(
          nameFirst: nameFirst,
          nameLast: nameLast,
          locationStreet: locationStreet,
          locationNumber: locationNumber,
          locationCity: locationCity,
          locationLatitude: locationLatitude,
          locationLongitude: locationLongitude,
          email: email,
          username: username,
          dateOfBirth: dateOfBirth,
          age: age,
          phone: phone,
          cell: cell,
          picture: picture,
        );

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      nameFirst: json['results'][0]['name']['first'],
      nameLast: json['results'][0]['name']['last'],
      locationStreet: json['results'][0]['location']['street']['name'],
      locationNumber: json['results'][0]['location']['street']['number'],
      locationCity: json['results'][0]['location']['city'],
      locationLatitude: json['results'][0]['location']['coordinates']
          ['latitude'],
      locationLongitude: json['results'][0]['location']['coordinates']
          ['longitude'],
      email: json['results'][0]['email'],
      username: json['results'][0]['login']['username'],
      dateOfBirth: json['results'][0]['dob']['date'],
      age: json['results'][0]['dob']['age'],
      phone: json['results'][0]['phone'],
      cell: json['results'][0]['cell'],
      picture: json['results'][0]['picture']['large'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': {'first': nameFirst, 'last': nameLast},
      'location': {
        'street': {'name': locationStreet, 'number': locationNumber},
        'city': locationCity,
        'coordinates': {
          'latitude': locationLatitude,
          'longitude': locationLongitude
        }
      },
      'email': email,
      'login': {'username': username},
      'dob': {'date': dateOfBirth, 'age': age},
      'phone': phone,
      'cell': cell,
      'picture': picture,
    };
  }
}
