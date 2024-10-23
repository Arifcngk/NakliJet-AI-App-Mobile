import 'package:flutter/material.dart';
import 'package:naklijet_demo/widget/custom_card.dart';

class PostFlowViewScreen extends StatelessWidget {
  const PostFlowViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          itemCount: 10,
          itemBuilder: (context, index) {
            return const Column(
              children: [
                CustomCard(),
                SizedBox(height: 6),
              ],
            );
          },
        ),
      ),
    );
  }
}
