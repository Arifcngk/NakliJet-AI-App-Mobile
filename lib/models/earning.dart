class Earning {
  final String id; // MongoDB’den gelen '_id'
  final String userId; // User’a referans
  final double totalEarnings; // Toplam kazanç
  final List<Transaction> transactions; // İşlem listesi
  final DateTime updatedAt;

  Earning({
    required this.id,
    required this.userId,
    required this.totalEarnings,
    required this.transactions,
    required this.updatedAt,
  });

  factory Earning.fromJson(Map<String, dynamic> json) {
    return Earning(
      id: json['_id'] as String,
      userId: json['userId'] as String,
      totalEarnings: (json['totalEarnings'] as num).toDouble(),
      transactions: (json['transactions'] as List<dynamic>)
          .map((transaction) =>
              Transaction.fromJson(transaction as Map<String, dynamic>))
          .toList(),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'totalEarnings': totalEarnings,
      'transactions':
          transactions.map((transaction) => transaction.toJson()).toList(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class Transaction {
  final String jobId; // UserJob’a referans
  final double amount; // Kazanılan miktar
  final DateTime date;

  Transaction({
    required this.jobId,
    required this.amount,
    required this.date,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      jobId: json['jobId'] as String,
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jobId': jobId,
      'amount': amount,
      'date': date.toIso8601String(),
    };
  }
}
