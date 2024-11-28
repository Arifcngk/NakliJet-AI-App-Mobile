import 'package:flutter/material.dart';
import 'package:naklijet_demo/models/vecihle_model.dart';

class VecihleProvider extends ChangeNotifier {
  final List<VecihleModel> _vecihle = [];

  List<VecihleModel> get vecihle => _vecihle;

  void addVecihle(String vecihleType, String plateNumber) {
    _vecihle
        .add(VecihleModel(vehicleTypes: vecihleType, plateNumber: plateNumber));

    // UI Güncelle
    notifyListeners();
  }
}
