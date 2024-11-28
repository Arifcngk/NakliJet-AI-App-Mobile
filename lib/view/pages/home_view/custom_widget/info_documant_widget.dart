import 'package:flutter/material.dart';
import 'package:naklijet_demo/view/pages/profile_view/setting/document_control_view.dart';
import 'package:unicons/unicons.dart';

class infoDocumant extends StatelessWidget {
  const infoDocumant({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        const Icon(
          UniconsLine.file_block_alt,
          color: Colors.white,
          size: 30,
        ),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Eksik Belgeleriniz Mevcut",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Text(
              "Ehliyet Ön Yüz - Arka Yüz ",
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 16,
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const DocumentControlView()));
          },
          icon: const Icon(
            UniconsLine.arrow_right,
            color: Colors.white,
            size: 30,
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}