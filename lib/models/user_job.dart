
// Kullanıcı güncel- geçmiş iş bilgileri modeli
class UserJob {
  String? id;
  String userId;
  String jobId;
  String status;
  DateTime startDate;
  DateTime? endDate;
  double earnings;
  DateTime createdAt;
  DateTime updatedAt;

  UserJob({
    this.id,
    required this.userId,
    required this.jobId,
    required this.status,
    required this.startDate,
    this.endDate,
    required this.earnings,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserJob.fromJson(Map<String, dynamic> json) {
    return UserJob(
      id: json['_id'],
      userId: json['userId'],
      jobId: json['jobId'],
      status: json['status'],
      startDate: DateTime.parse(json['startDate']),
      endDate: json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
      earnings: (json['earnings'] ?? 0).toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'jobId': jobId,
      'status': status,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'earnings': earnings,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
