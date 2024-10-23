import 'package:flutter/material.dart';

class JobsViewScreen extends StatefulWidget {
  final String appBarTitle;
  const JobsViewScreen({super.key, required this.appBarTitle});

  @override
  State<JobsViewScreen> createState() => _JobsViewScreenState();
}

class _JobsViewScreenState extends State<JobsViewScreen> {
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
              title: Text(
                widget.appBarTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
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
      body: Center(
        child: Text("Profile View"),
      ),
    );
  }
}
