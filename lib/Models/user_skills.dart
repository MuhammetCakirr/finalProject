import 'dart:convert';
import 'user.dart'; // User modelini import edin

class UserSkill {
  final String skillName;
  final String skillLevel;
  final DateTime createdAt;
  final User? user; // ForeignKey ilişkisi opsiyonel olabilir

  UserSkill({
    required this.skillName,
    required this.skillLevel,
    required this.createdAt,
    this.user,
  });

  // JSON'dan Dart nesnesine dönüştürme
  factory UserSkill.fromJson(Map<String, dynamic> json) {
    return UserSkill(
      skillName: json['skill_name'],
      skillLevel: json['skill_level'],
      createdAt: DateTime.parse(json['created_at']),
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  // Dart nesnesinden JSON'a dönüştürme
  Map<String, dynamic> toJson() {
    return {
      'skill_name': skillName,
      'skill_level': skillLevel,
      'created_at': createdAt.toIso8601String(),
      'user': user?.toJson(), // ForeignKey ilişkisi varsa JSON'a dönüştür
    };
  }

  // JSON String'den Dart nesnesine dönüştürme
  static UserSkill fromJsonString(String jsonString) {
    return UserSkill.fromJson(json.decode(jsonString));
  }

  // Dart nesnesinden JSON String'e dönüştürme
  String toJsonString() {
    return json.encode(toJson());
  }
}
