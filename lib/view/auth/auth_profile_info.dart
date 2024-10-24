import 'package:flutter/material.dart';
import 'package:naklijet_demo/view/app_view.dart';
import 'package:naklijet_demo/view/pages/home_view/home_view.dart';
import 'package:naklijet_demo/widget/custom_btn_widget.dart';
import 'package:naklijet_demo/widget/custom_textfield.dart';
import 'package:unicons/unicons.dart';

class AuthProfileInfo extends StatelessWidget {
  const AuthProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            // Column'ı kaydırılabilir yapmak için SingleChildScrollView eklendi
            child: Column(
              children: [
                const SizedBox(height: 100),
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.red[100],
                  child: Icon(
                    UniconsLine.user_circle,
                    color: Colors.red.shade800,
                    size: 60,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Bilgileriniz Eksik",
                  style: TextStyle(color: Colors.red.shade800, fontSize: 26),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Naklijet Uygulamasını Kullanabilmek İçin\nBilgilerinizi Tamamlamanız Gerekmektedir.",
                  textAlign: TextAlign.center, // Texti ortalamak için
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const customTextField(
                            text: "Adınız",
                            hintText: "Adınızı Giriniz",
                          ),
                          const SizedBox(height: 10),
                          const customTextField(
                            text: "Soyadınız",
                            hintText: "Soyadınızı Giriniz",
                          ),
                          const SizedBox(height: 10),
                          const customTextField(
                            text: "Doğum Tarihi",
                            hintText: "Doğum Tarihinizi Giriniz",
                          ),
                          const SizedBox(height: 10),
                          const customTextField(
                            text: "TCKN",
                            hintText: "TC Numaranızı  Giriniz",
                          ),
                          const SizedBox(height: 60),
                          customBtnWidget(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const AppViewScreen(),
                              ));
                            },
                          ),
                          const SizedBox(height: 60)
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
