class Employer {
  final String id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String role;
  final DateTime createdAt;
  final DateTime updatedAt;

  Employer({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Employer.fromJson(Map<String, dynamic> json) {
    return Employer(
      id: json['_id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      role: json['role'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'role': role,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}