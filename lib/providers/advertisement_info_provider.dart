import 'package:flutter/material.dart';
import 'package:naklijet_demo/models/advertisement_info_model.dart';

class AdvertisementInformationProvider extends ChangeNotifier {
  final List<AdvertisementInformationModel> _advertisements = [
    AdvertisementInformationModel(
        id: "3421",
        startPlace: "Bolu",
        finishPlace: "Kocaeli",
        advertDate: "28.11.2024",
        advertPrice: 1200,
        advertMust: ["16.30 Açık", "20", "Kuru Yük", "Tır"],
        customerLitle: "Operasyon Müdürü",
        customerName: "Arif Can Gök"),
    AdvertisementInformationModel(
        id: "1245",
        startPlace: "Bursa",
        finishPlace: "Malatya",
        advertDate: "28.11.2024",
        advertPrice: 1200,
        advertMust: ["16.30 Kapalı", "30", "Temizlik Malzemesi", "Tır"],
        customerLitle: "Operasyon Müdürü",
        customerName: "Mehmet Sezer"),
    AdvertisementInformationModel(
        id: "6720",
        startPlace: "Trabzon",
        finishPlace: "Kocaeli",
        advertDate: "28.11.2024",
        advertPrice: 1200,
        advertMust: ["16.30 Açık", "10", "Boş Yük", "Kamyon"],
        customerLitle: "Operasyon Müdürü",
        customerName: "Atakan Çalıkoğlu"),
  ];

  List<AdvertisementInformationModel> get advertisements => _advertisements;
}