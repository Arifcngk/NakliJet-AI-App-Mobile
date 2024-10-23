import 'package:flutter/material.dart';

class JobsViewScreen extends StatefulWidget {
  const JobsViewScreen({super.key});

  @override
  State<JobsViewScreen> createState() => _JobsViewScreenState();
}

class _JobsViewScreenState extends State<JobsViewScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        backgroundColor: const Color(0xFFEEEDEB),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Mevcut İşlerim",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(
            tabs: const [
              Tab(text: 'Aktif İşlerim'),
              Tab(text: 'Geçmiş İşlerim'),
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
            Center(child: Text("Aktif İşiniz Bulunmamaktadır")),
            Center(child: Text("Geçmiş İşiniz Bulunmamaktadır")),
          ],
        ),
      ),
    );
  }
}
