import 'package:flutter/material.dart';
import 'package:naklijet_demo/models/vehicle_model.dart';

class VehicleProvider extends ChangeNotifier {
  final List<VecihleModel> _vecihle = [];

  List<VecihleModel> get vecihle => _vecihle;

  // Araç Ekleme Fonksiyonu
  void addVehicle(String vecihleType, String plateNumber) {
    _vecihle.add(
        VecihleModel(vehicleTypes: vecihleType, plateNumber: plateNumber));
    // UI Güncelle
    notifyListeners();
  }

  // Araç Silme Fonksiyonu
  void removeVehicle(String plateNumber) {
    _vecihle.removeWhere((vehicle) => vehicle.plateNumber == plateNumber);
    // UI Güncelle
    notifyListeners();
  }
}
