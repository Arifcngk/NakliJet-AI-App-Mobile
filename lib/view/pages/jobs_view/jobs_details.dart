import 'package:flutter/material.dart';
import 'package:naklijet_demo/view/pages/jobs_view/jobs_widget/jobs_contact_card_widget.dart';
import 'package:naklijet_demo/view/pages/jobs_view/jobs_widget/jobs_no_and_date.dart';
import 'package:naklijet_demo/view/pages/jobs_view/jobs_widget/rota_jobs.dart';
import 'package:unicons/unicons.dart';

class JobsDetailsScreen extends StatelessWidget {
  const JobsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FractionallySizedBox(
            heightFactor: 0.4,
            widthFactor: 1.0,
            child: Container(
              color: Colors.red,
              child: Image.asset(
                'assets/image/maps.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                // Kaydırma özelliği ekleniyor
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    JobsDateAndNo(context: context),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Güzergah",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const SizedBox(height: 10),
                          RotaJobsWidget(context: context),
                          const SizedBox(height: 20),
                          _jobs_info_rounded_Card(context),
                          const SizedBox(height: 20),
                          const ContactCardWidget(),
                          const SizedBox(height: 20),
                          Card(
                            color: Colors.white,
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.09,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Sefer Fiyatı :",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        const Text("₺₺₺₺₺₺₺ +KDV",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            )),
                                      ],
                                    ),
                                    const Spacer(),
                                    _offerButton(context),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  ElevatedButton _offerButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: () {
        // Butona basıldığında yapılacak işlem
      },
      child: const Text(
        "Teklif Ver",
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }

  Card _jobs_info_rounded_Card(BuildContext context) {
    return Card(
      elevation: 3, // Gölgelendirme ekliyoruz
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Köşeleri yuvarlatıyoruz
      ),
      color: Colors.white,
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: Colors.yellow,
          radius: 18, // İkonu biraz küçültüyoruz
          child: Icon(
            UniconsLine.exclamation_octagon,
            size: 24, // İkon boyutunu küçült
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        title: const Text(
          'Taşıma Gereksinimleri',
          style: TextStyle(
            fontSize: 18, // Yazı boyutunu biraz küçültüyoruz
            fontWeight: FontWeight.bold, // Yazıyı kalınlaştırarak vurguluyoruz
          ),
          textAlign: TextAlign.center,
        ),
        textColor: Theme.of(context).colorScheme.primary,
        iconColor: Theme.of(context)
            .colorScheme
            .primary, // Açma/kapatma ikonunun rengi
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 8),
                Divider(color: Colors.grey.shade300, thickness: 1),
                _carryingRequirement(key: " DORSE :", value: " 16.30 Açık"),
                const SizedBox(height: 8),
                Divider(color: Colors.grey.shade300, thickness: 1),
                _carryingRequirement(key: "TONAJ", value: "20-25 Ton Max"),
                const SizedBox(height: 8),
                Divider(color: Colors.grey.shade300, thickness: 1),
                _carryingRequirement(key: "ÜRÜN TİPİ", value: "Kuru Yük"),
                const SizedBox(height: 8),
                Divider(color: Colors.grey.shade300, thickness: 1),
                _carryingRequirement(key: "ARAÇ TİPİ", value: "Tır"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _carryingRequirement({required String key, required String value}) {
    return Row(
      children: [
        Text(
          key,
          style: TextStyle(
            color: Colors.grey.shade700,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}