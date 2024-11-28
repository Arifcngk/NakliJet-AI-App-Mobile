import 'package:flutter/material.dart';
import 'package:naklijet_demo/view/pages/my_cars_view/my_cars_widget/add_button_widget.dart';

class MyTrailersPage extends StatelessWidget {
  const MyTrailersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/image/choose.png"),
            const Text(
              "Dorseniz Bulunmamaktadır",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            AddButttonWidget(
              text: "Dorse Ekle",
              onPressed: () {
                // Add button action
              },
            )
          ],
        ),
      ),
    );
  }
}
