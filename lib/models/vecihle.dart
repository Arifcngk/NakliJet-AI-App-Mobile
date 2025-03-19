// Araç Bilgileri
class Vehicle {
  String? id;
  String userId;
  String vehicleType;
  String licensePlate;
  Trailer trailer;
  DateTime createdAt;
  DateTime updatedAt;

  Vehicle({
    this.id,
    required this.userId,
    required this.vehicleType,
    required this.licensePlate,
    required this.trailer,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['_id'],
      userId: json['userId'],
      vehicleType: json['vehicleType'],
      licensePlate: json['licensePlate'],
      trailer: Trailer.fromJson(json['trailer']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'vehicleType': vehicleType,
      'licensePlate': licensePlate,
      'trailer': trailer.toJson(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

// Dorse Tipi
class Trailer {
  String trailerType;

  Trailer({required this.trailerType});

  factory Trailer.fromJson(Map<String, dynamic> json) {
    return Trailer(
      trailerType: json['trailerType'],
    );
  }

  Map<String, dynamic> toJson() => {
        'trailerType': trailerType,
      };
}
