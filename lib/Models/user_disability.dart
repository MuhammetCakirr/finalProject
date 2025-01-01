import 'dart:convert';
import 'user.dart'; // User modelini import edin

class UserDisability {
  final String disability;
  final int disabilityRate;
  final DateTime createdAt;
  final User? user; // ForeignKey ilişkisi opsiyonel olabilir

  UserDisability({
    required this.disability,
    required this.disabilityRate,
    required this.createdAt,
    this.user,
  });

  // JSON'dan Dart nesnesine dönüştürme
  factory UserDisability.fromJson(Map<String, dynamic> json) {
    return UserDisability(
      disability: json['disability'],
      disabilityRate: json['disability_rate'],
      createdAt: DateTime.parse(json['created_at']),
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  // Dart nesnesinden JSON'a dönüştürme
  Map<String, dynamic> toJson() {
    return {
      'disability': disability,
      'disability_rate': disabilityRate,
      'created_at': createdAt.toIso8601String(),
      'user': user?.toJson(),
    };
  }

  // JSON String'den Dart nesnesine dönüştürme
  static UserDisability fromJsonString(String jsonString) {
    return UserDisability.fromJson(json.decode(jsonString));
  }

  // Dart nesnesinden JSON String'e dönüştürme
  String toJsonString() {
    return json.encode(toJson());
  }
}
