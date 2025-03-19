class JobPosting {
  final String id;
  final String? tripNumber;
  final DateTime date;
  final Route route;
  final Requirements requirements;
  final String postedBy; // Employer ID’si
  final double price;
  final String status;
  final String? assignedTo;
  final List<Offer> offers;
  final DateTime createdAt;
  final DateTime updatedAt;

  JobPosting({
    required this.id,
    this.tripNumber,
    required this.date,
    required this.route,
    required this.requirements,
    required this.postedBy,
    required this.price,
    required this.status,
    this.assignedTo,
    required this.offers,
    required this.createdAt,
    required this.updatedAt,
  });

  factory JobPosting.fromJson(Map<String, dynamic> json) {
    return JobPosting(
      id: json['_id'] as String,
      tripNumber: json['tripNumber'] as String?,
      date: DateTime.parse(json['date'] as String),
      route: Route.fromJson(json['route'] as Map<String, dynamic>),
      requirements: Requirements.fromJson(json['requirements'] as Map<String, dynamic>),
      postedBy: json['postedBy'] as String, // Employer ID
      price: (json['price'] as num).toDouble(),
      status: json['status'] as String,
      assignedTo: json['assignedTo'] as String?,
      offers: (json['offers'] as List<dynamic>)
          .map((offer) => Offer.fromJson(offer as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'tripNumber': tripNumber,
      'date': date.toIso8601String(),
      'route': route.toJson(),
      'requirements': requirements.toJson(),
      'postedBy': postedBy,
      'price': price,
      'status': status,
      'assignedTo': assignedTo,
      'offers': offers.map((offer) => offer.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}



 
// Güzergah bilgisi
class Route {
  final String departure;
  final String arrival;

  Route({required this.departure, required this.arrival});

  factory Route.fromJson(Map<String, dynamic> json) {
    return Route(
      departure: json['departure'] as String,
      arrival: json['arrival'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'departure': departure,
      'arrival': arrival,
    };
  }
}

// Taşıma gereksinimleri
class Requirements {
  final String vehicleBodyType;
  final double tonnage;
  final String productType;
  final String vehicleType;

  Requirements({
    required this.vehicleBodyType,
    required this.tonnage,
    required this.productType,
    required this.vehicleType,
  });

  factory Requirements.fromJson(Map<String, dynamic> json) {
    return Requirements(
      vehicleBodyType: json['vehicleBodyType'] as String,
      tonnage: (json['tonnage'] as num).toDouble(),
      productType: json['productType'] as String,
      vehicleType: json['vehicleType'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vehicleBodyType': vehicleBodyType,
      'tonnage': tonnage,
      'productType': productType,
      'vehicleType': vehicleType,
    };
  }
}



// Teklifler
class Offer {
  final String userId; // Kullanıcı ID’si
  final double? offerPrice; // Teklif fiyatı, nullable
  final DateTime timestamp;

  Offer({
    required this.userId,
    this.offerPrice,
    required this.timestamp,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      userId: json['userId'] as String,
      offerPrice: json['offerPrice'] != null ? (json['offerPrice'] as num).toDouble() : null,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'offerPrice': offerPrice,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}