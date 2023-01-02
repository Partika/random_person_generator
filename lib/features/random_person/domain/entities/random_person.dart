import 'package:equatable/equatable.dart';

class RandomPerson extends Equatable {
  // nome
  final String nameFirst;
  final String nameLast;
  // localizacao
  final String locationStreet;
  final int locationNumber;
  final String locationCity;
  final String locationState;
  final String locationCountry;
  // email
  final String email;
  final String loginUser;
  final String loginPassword;
  // idade
  final String dateOfBirth;
  final int age;
  // celular
  final String phone;
  final String cell;
  // imagem
  final String picture;
  // naturalidade
  final String nat;

  const RandomPerson({
    required this.nameFirst,
    required this.nameLast,
    required this.locationStreet,
    required this.locationNumber,
    required this.locationCity,
    required this.locationState,
    required this.locationCountry,
    required this.email,
    required this.loginUser,
    required this.loginPassword,
    required this.dateOfBirth,
    required this.age,
    required this.phone,
    required this.cell,
    required this.picture,
    required this.nat,
  });

  @override
  List<Object?> get props => [
        nameFirst,
        nameLast,
        locationStreet,
        locationNumber,
        locationCity,
        locationState,
        locationCountry,
        email,
        loginUser,
        loginPassword,
        dateOfBirth,
        age,
        phone,
        cell,
        picture,
        nat,
      ];
}
