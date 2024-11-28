import 'package:flutter/material.dart';
import 'package:naklijet_demo/providers/advertisement_info_provider.dart';
import 'package:naklijet_demo/view/pages/jobs_view/jobs_details.dart';
import 'package:naklijet_demo/widget/custom_card.dart';
import 'package:provider/provider.dart';

class PostFlowViewScreen extends StatelessWidget {
  const PostFlowViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final advertisements =
        Provider.of<AdvertisementInformationProvider>(context).advertisements;
    return Scaffold(
      backgroundColor: const Color(0xFFEEEDEB),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), // AppBar'ın yüksekliği
        child: Column(
          children: [
            AppBar(
              centerTitle: true,
              title: const Text(
                "Seferler",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0, // Gölgeyi kaldırıyoruz
            ),
            // AppBar'ın altındaki çizgi
            Container(
              height: 0.2, // Çizgi kalınlığı
              color: Colors.grey, // Çizgi rengi
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          itemCount: advertisements.length,
          itemBuilder: (context, index) {
            final ad = advertisements[index];
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JobsDetailsScreen(
                              id: ad.id,
                              customerName: ad.customerName,
                              customerTitle: ad.customerTitle,
                              startPlace: ad.startPlace,
                              finishPlace: ad.finishPlace,
                              advertDate: ad.advertDate,
                              advertPrice: ad.advertPrice,
                              advertMust: ad.advertMust),
                        ));
                  },
                  child: CustomCard(
                    advertDate: ad.advertDate,
                    advertPrice: ad.advertPrice,
                    finishPlace: ad.finishPlace,
                    id: ad.id,
                    startPlace: ad.startPlace,
                  ),
                ),
                SizedBox(height: 6),
              ],
            );
          },
        ),
      ),
    );
  }
}
