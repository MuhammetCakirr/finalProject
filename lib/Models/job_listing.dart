import 'dart:convert';

class JobListing {
  final String jobTitle;
  final String location;
  final String employmentType;
  final String detailUrl;
  final DateTime postedDate;
  final String companyName;
  final String companyPhotoUrl;
  final String jobDescription;
  final String sourceSite;
  final String postUniqueId;
  final DateTime createdAt;

  JobListing({
    required this.jobTitle,
    required this.location,
    required this.employmentType,
    required this.detailUrl,
    required this.postedDate,
    required this.companyName,
    required this.companyPhotoUrl,
    required this.jobDescription,
    required this.sourceSite,
    required this.postUniqueId,
    required this.createdAt,
  });

  // JSON'dan Dart nesnesine dönüştürme
  factory JobListing.fromJson(Map<String, dynamic> json) {
    return JobListing(
      jobTitle: json['job_title'],
      location: json['location'],
      employmentType: json['employment_type'],
      detailUrl: json['detail_url'],
      postedDate: DateTime.parse(json['posted_date']),
      companyName: json['company_name'],
      companyPhotoUrl: json['company_photo_url'],
      jobDescription: json['job_description'],
      sourceSite: json['source_site'],
      postUniqueId: json['post_unique_id'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  // Dart nesnesinden JSON'a dönüştürme
  Map<String, dynamic> toJson() {
    return {
      'job_title': jobTitle,
      'location': location,
      'employment_type': employmentType,
      'detail_url': detailUrl,
      'posted_date': postedDate.toIso8601String(),
      'company_name': companyName,
      'company_photo_url': companyPhotoUrl,
      'job_description': jobDescription,
      'source_site': sourceSite,
      'post_unique_id': postUniqueId,
      'created_at': createdAt.toIso8601String(),
    };
  }

  // JSON String'den Dart nesnesine dönüştürme
  static JobListing fromJsonString(String jsonString) {
    return JobListing.fromJson(json.decode(jsonString));
  }

  // Dart nesnesinden JSON String'e dönüştürme
  String toJsonString() {
    return json.encode(toJson());
  }
}
