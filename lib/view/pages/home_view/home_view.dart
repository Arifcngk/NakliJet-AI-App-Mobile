import 'package:flutter/material.dart';
import 'package:naklijet_demo/providers/advertisement_info_provider.dart';
import 'package:naklijet_demo/view/pages/home_view/custom_widget/info_documant_widget.dart';
import 'package:naklijet_demo/widget/custom_card.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';

class HomeViewScreen extends StatelessWidget {
  const HomeViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Üst kısmı oluşturuyoruz (Ekranın %60'ı)
          FractionallySizedBox(
            heightFactor: 0.6,
            widthFactor: 1.0,
            alignment: Alignment.topCenter,
            child: Container(
              color: const Color(0xFF0c72fb),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    _helloUserText(),
                    const SizedBox(height: 30),
                    const Text(
                      "Belge Kontrolü",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: double.infinity,
                      child: const infoDocumant(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Alt kısmı oluşturuyoruz (Ekranın %40'ı)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: const BoxDecoration(
                color: Color(0xFFEEEDEB),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          'Önerilen İlanlar',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Consumer ile veri değişimini dinliyoruz
                    Consumer<AdvertisementInformationProvider>(
                      builder: (context, provider, child) {
                        final advertisements = provider.advertisements;
                        return Expanded(
                          child: ListView.builder(
                            itemCount: advertisements.length,
                            itemBuilder: (context, index) {
                              final ad = advertisements[index];
                              return Column(
                                children: [
                                  CustomCard(
                                    advertDate: ad.advertDate,
                                    advertPrice: ad.advertPrice,
                                    finishPlace: ad.finishPlace,
                                    id: ad.id,
                                    startPlace: ad.startPlace,
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _helloUserText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
              child: Icon(
                UniconsLine.user_circle,
                size: 30,
              ),
            ),
            SizedBox(width: 10),
            Text(
              'Günaydın, User',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              UniconsLine.bell,
              color: Colors.white,
              size: 30,
            )),
      ],
    );
  }
}
