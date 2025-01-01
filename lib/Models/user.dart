import 'dart:convert';

class User {
  final String name;
  final String surname;
  final String cellPhone;
  final String email;
  final String location;
  final String gender;
  final DateTime dateJoined;

  User({
    required this.name,
    required this.surname,
    required this.cellPhone,
    required this.email,
    required this.location,
    required this.gender,
    required this.dateJoined,
  });

  // JSON'dan Dart nesnesine dönüştürme
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      surname: json['surname'],
      cellPhone: json['cell_phone'],
      email: json['email'],
      location: json['location'],
      gender: json['gender'],
      dateJoined: DateTime.parse(json['date_joined']),
    );
  }

  // Dart nesnesinden JSON'a dönüştürme
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'cell_phone': cellPhone,
      'email': email,
      'location': location,
      'gender': gender,
      'date_joined': dateJoined.toIso8601String(),
    };
  }

  // JSON String'den Dart nesnesine dönüştürme
  static User fromJsonString(String jsonString) {
    return User.fromJson(json.decode(jsonString));
  }

  // Dart nesnesinden JSON String'e dönüştürme
  String toJsonString() {
    return json.encode(toJson());
  }
}
