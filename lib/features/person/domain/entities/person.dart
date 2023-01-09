import 'package:equatable/equatable.dart';

class Person extends Equatable {
  // nome
  final String nameFirst;
  final String nameLast;
  // localizacao
  final String locationStreet;
  final int locationNumber;
  final String locationCity;
  final String locationLatitude;
  final String locationLongitude;
  // email
  final String email;
  final String username;
  // idade
  final String dateOfBirth;
  final int age;
  // celular
  final String phone;
  final String cell;
  // imagem
  final String picture;

  const Person({
    required this.nameFirst,
    required this.nameLast,
    required this.locationStreet,
    required this.locationNumber,
    required this.locationCity,
    required this.locationLatitude,
    required this.locationLongitude,
    required this.email,
    required this.username,
    required this.dateOfBirth,
    required this.age,
    required this.phone,
    required this.cell,
    required this.picture,
  });

  @override
  List<Object?> get props => [
        nameFirst,
        nameLast,
        locationStreet,
        locationNumber,
        locationCity,
        locationLatitude,
        locationLongitude,
        email,
        dateOfBirth,
        age,
        phone,
        cell,
        picture,
      ];
}
