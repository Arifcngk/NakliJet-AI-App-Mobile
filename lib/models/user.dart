// kullanıcı bilgileri

class User {
  final String id;
  final String phoneNumber;
  final String firstName;
  final String lastName;
  final DateTime birthDate;
  final String tcNumber;
  final Documents documents;
  final bool isFirstLogin; // Yeni alan
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.tcNumber,
    required this.documents,
    required this.isFirstLogin,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] as String,
      phoneNumber: json['phoneNumber'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
      tcNumber: json['tcNumber'] as String,
      documents: Documents.fromJson(json['documents'] as Map<String, dynamic>),
      isFirstLogin: json['isFirstLogin'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'phoneNumber': phoneNumber,
      'firstName': firstName,
      'lastName': lastName,
      'birthDate': birthDate.toIso8601String(),
      'tcNumber': tcNumber,
      'documents': documents.toJson(),
      'isFirstLogin': isFirstLogin,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class Documents {
  final String driverLicenseFront;
  final String driverLicenseBack;
  final String srcCertificate;
  final String authorityCertificate;

  Documents({
    required this.driverLicenseFront,
    required this.driverLicenseBack,
    required this.srcCertificate,
    required this.authorityCertificate,
  });

  factory Documents.fromJson(Map<String, dynamic> json) {
    return Documents(
      driverLicenseFront: json['driverLicenseFront'] ?? '',
      driverLicenseBack: json['driverLicenseBack'] ?? '',
      srcCertificate: json['srcCertificate'] ?? '',
      authorityCertificate: json['authorityCertificate'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'driverLicenseFront': driverLicenseFront,
      'driverLicenseBack': driverLicenseBack,
      'srcCertificate': srcCertificate,
      'authorityCertificate': authorityCertificate,
    };
  }
}
