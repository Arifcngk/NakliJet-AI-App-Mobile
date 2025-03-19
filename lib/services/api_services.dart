import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:naklijet_demo/models/jop_posting.dart';
import 'package:naklijet_demo/models/vecihle.dart';
import '../models/user.dart';
import '../models/user_job.dart';
import '../models/earning.dart';

class ApiService {
  static const String baseUrl =
      'http://192.168.56.1:3000'; // Backend URL’nizi buraya göre ayarlayın

  // --- User (Taşıyıcı) Metodları ---
  Future<User> loginUser(String phoneNumber) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'phoneNumber': phoneNumber}),
    );
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Kullanıcı girişi başarısız');
    }
  }

  Future<User> createUser(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Kullanıcı oluşturulamadı');
    }
  }

  Future<User> updateUser(String userId, User user) async {
    final response = await http.put(
      Uri.parse('$baseUrl/users/$userId'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Kullanıcı güncellenemedi');
    }
  }

  // --- JobPosting (İş İlanları) Metodları ---
  Future<List<JobPosting>> fetchJobPostings() async {
    final response = await http.get(Uri.parse('$baseUrl/job-postings'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => JobPosting.fromJson(job)).toList();
    } else {
      throw Exception('İş ilanları yüklenemedi');
    }
  }

  Future<JobPosting> updateJobPosting(
      String jobId, JobPosting jobPosting) async {
    final response = await http.put(
      Uri.parse('$baseUrl/job-postings/$jobId'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(jobPosting.toJson()),
    );
    if (response.statusCode == 200) {
      return JobPosting.fromJson(json.decode(response.body));
    } else {
      throw Exception('İş ilanı güncellenemedi');
    }
  }

  // Kullanıcı bir iş için teklif verme (örnek bir metod)
  Future<JobPosting> submitOffer(
      String jobId, String userId, double offerPrice) async {
    final response = await http.post(
      Uri.parse('$baseUrl/job-postings/$jobId/offer'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'userId': userId,
        'offerPrice': offerPrice,
      }),
    );
    if (response.statusCode == 200) {
      return JobPosting.fromJson(json.decode(response.body));
    } else {
      throw Exception('Teklif gönderilemedi');
    }
  }

  // --- UserJob (Kullanıcı İşleri) Metodları ---
  Future<List<UserJob>> fetchUserJobs(String userId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/user-jobs?userId=$userId'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => UserJob.fromJson(job)).toList();
    } else {
      throw Exception('Kullanıcı işleri yüklenemedi');
    }
  }

  Future<UserJob> createUserJob(UserJob userJob) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user-jobs'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(userJob.toJson()),
    );
    if (response.statusCode == 200) {
      return UserJob.fromJson(json.decode(response.body));
    } else {
      throw Exception('Kullanıcı işi oluşturulamadı');
    }
  }

  Future<UserJob> updateUserJob(String userJobId, UserJob userJob) async {
    final response = await http.put(
      Uri.parse('$baseUrl/user-jobs/$userJobId'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(userJob.toJson()),
    );
    if (response.statusCode == 200) {
      return UserJob.fromJson(json.decode(response.body));
    } else {
      throw Exception('Kullanıcı işi güncellenemedi');
    }
  }

  // --- Vehicle (Araçlar) Metodları ---
  Future<List<Vehicle>> fetchVehicles(String userId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/vehicles?userId=$userId'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((vehicle) => Vehicle.fromJson(vehicle)).toList();
    } else {
      throw Exception('Araçlar yüklenemedi');
    }
  }

  Future<Vehicle> createVehicle(Vehicle vehicle) async {
    final response = await http.post(
      Uri.parse('$baseUrl/vehicles'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(vehicle.toJson()),
    );
    if (response.statusCode == 200) {
      return Vehicle.fromJson(json.decode(response.body));
    } else {
      throw Exception('Araç oluşturulamadı');
    }
  }

  Future<Vehicle> updateVehicle(String vehicleId, Vehicle vehicle) async {
    final response = await http.put(
      Uri.parse('$baseUrl/vehicles/$vehicleId'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(vehicle.toJson()),
    );
    if (response.statusCode == 200) {
      return Vehicle.fromJson(json.decode(response.body));
    } else {
      throw Exception('Araç güncellenemedi');
    }
  }

  Future<void> deleteVehicle(String vehicleId) async {
    final response =
        await http.delete(Uri.parse('$baseUrl/vehicles/$vehicleId'));
    if (response.statusCode != 200) {
      throw Exception('Araç silinemedi');
    }
  }

  // --- Earning (Kazançlar) Metodları ---
  Future<Earning> fetchEarnings(String userId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/earnings?userId=$userId'));
    if (response.statusCode == 200) {
      return Earning.fromJson(json.decode(response.body));
    } else {
      throw Exception('Kazançlar yüklenemedi');
    }
  }

  Future<Earning> updateEarnings(String earningId, Earning earning) async {
    final response = await http.put(
      Uri.parse('$baseUrl/earnings/$earningId'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(earning.toJson()),
    );
    if (response.statusCode == 200) {
      return Earning.fromJson(json.decode(response.body));
    } else {
      throw Exception('Kazançlar güncellenemedi');
    }
  }
}
