import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:naklijet_demo/view/auth/auth_profile_info.dart';
import 'package:naklijet_demo/widget/custom_btn_widget.dart';

class LoginViewSceen extends StatelessWidget {
  const LoginViewSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 1,
            ),
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              radius: 45,
              child: const Icon(
                Icons.phone_enabled_outlined,
                color: Colors.white,
                size: 40,
              ),
            ),
            const SizedBox(height: 20),
            Text("Hoşgeldiniz",
                style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 20),
            Text(
              "Giriş yapmak için telefon numaranızı girin",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            phoneInputButton(context),
            const SizedBox(height: 20),
            customBtnWidget(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AuthProfileInfo(),
                ),
              );
            },),
            const SizedBox(height: 30),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Kayıt Olarak ', // İlk kısım
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.grey), // Hafif gri
                children: [
                  TextSpan(
                    text: 'Üyelik Sözleşmesi', // "Üyelik Sözleşmesi" kısmı
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).primaryColor), // Primary renk
                  ),
                  const TextSpan(
                    text: ' ve ', // Bağlantı kısmı
                    style: TextStyle(color: Colors.grey), // Hafif gri
                  ),
                  TextSpan(
                    text: 'Aydınlatma Metni', // "aydınlatma metni" kısmı
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).primaryColor), // Primary renk
                  ),
                  const TextSpan(
                    text: ' kabul etmiş olursunuz.', // Son kısım
                    style: TextStyle(color: Colors.grey), // Hafif gri
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 3,
            )
          ],
        ),
      ),
    );
  }

  IntlPhoneField phoneInputButton(BuildContext context) {
    return IntlPhoneField(
      decoration: InputDecoration(
        hintText: '(5XX) XXX XXX',
        labelStyle: const TextStyle(
          fontSize: 16,
          color: Colors.black, // Label yazısı siyah
        ),
        hintStyle: const TextStyle(
          color: Colors.grey, // Örnek gösterim yazısı gri
        ),
        // errorText: "Geçerli bir telefon numarası girin",
        filled: true, // Arka plan rengini belirlemek için
        fillColor: Theme.of(context)
            .colorScheme
            .secondary, // Arka plan rengini sarı yapar
        border: const OutlineInputBorder(
          borderSide:
              BorderSide.none, // Gölgeyi kaldırmak için kenarları kaldır
        ),
      ),
      initialCountryCode: 'TR',
      onChanged: (phone) {
        // print(phone.completeNumber);
      },
      style: const TextStyle(
        fontSize: 16, // Telefon numarası metni boyutu
      ),
    );
  }
}

