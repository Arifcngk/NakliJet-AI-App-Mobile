import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class DocumentControlView extends StatelessWidget {
  const DocumentControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(UniconsLine.arrow_left, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Belgelerim",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                _listTileDocument(title: "Ehliyet Ön Yüz"),
                _listTileDocument(title: "Ehliyet Arka Yüz"),
                _listTileDocument(title: "Psikoteknik Belgesi"),
                _listTileDocument(title: "SRC Belgesi"),
                _listTileDocument(title: "Yetki Belgesi"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Card _listTileDocument({required String title}) {
    return Card(
      color: Colors.white,
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: const Card(
          color: Colors.blue,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              UniconsLine.document_info,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
