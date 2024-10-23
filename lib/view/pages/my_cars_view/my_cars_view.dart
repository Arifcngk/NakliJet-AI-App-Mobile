import 'package:flutter/material.dart';

class MyCarsViewScreen extends StatefulWidget {
  const MyCarsViewScreen({super.key});

  @override
  State<MyCarsViewScreen> createState() => _MyCarsViewScreenState();
}

class _MyCarsViewScreenState extends State<MyCarsViewScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        backgroundColor: const Color(0xFFEEEDEB),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Araçlarım",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(
            tabs: const [
              Tab(text: 'Araçlarım'),
              Tab(text: 'Dorselerim'),
            ],
            indicatorColor: Theme.of(context)
                .colorScheme
                .primary, // Customize indicator color
            labelColor: Theme.of(context)
                .colorScheme
                .primary, // Color of the selected tab text
            unselectedLabelColor: Colors.grey, // Color of unselected tab text
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text("Aracınız  Bulunmamaktadır")),
            Center(child: Text("Dorseniz  Bulunmamaktadır")),
          ],
        ),
      ),
    );
  }
}
