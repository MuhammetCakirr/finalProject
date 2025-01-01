import 'dart:convert';
import 'job_listing.dart'; // JobListing modelinin olduğu dosyayı import edin

class JobRequirement {
  final String requirementDetail;
  final DateTime createdAt;
  final JobListing? jobPost; // ForeignKey ilişkisi, nullable olabilir

  JobRequirement({
    required this.requirementDetail,
    required this.createdAt,
    this.jobPost,
  });

  // JSON'dan Dart nesnesine dönüştürme
  factory JobRequirement.fromJson(Map<String, dynamic> json) {
    return JobRequirement(
      requirementDetail: json['requirement_detail'],
      createdAt: DateTime.parse(json['created_at']),
      jobPost: json['job_post'] != null
          ? JobListing.fromJson(json['job_post'])
          : null,
    );
  }

  // Dart nesnesinden JSON'a dönüştürme
  Map<String, dynamic> toJson() {
    return {
      'requirement_detail': requirementDetail,
      'created_at': createdAt.toIso8601String(),
      'job_post': jobPost?.toJson(), // Eğer ilişki varsa JSON'a dönüştür
    };
  }

  // JSON String'den Dart nesnesine dönüştürme
  static JobRequirement fromJsonString(String jsonString) {
    return JobRequirement.fromJson(json.decode(jsonString));
  }

  // Dart nesnesinden JSON String'e dönüştürme
  String toJsonString() {
    return json.encode(toJson());
  }
}
