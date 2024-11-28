import 'package:flutter/material.dart';
import 'package:naklijet_demo/core/package/phoneField_widget.dart';
import 'package:naklijet_demo/providers/phone_auth_provider.dart';
import 'package:naklijet_demo/view/app_view.dart';
import 'package:naklijet_demo/view/auth/auth_profile_info.dart';
import 'package:provider/provider.dart';

class LoginViewSceen extends StatelessWidget {
  const LoginViewSceen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<PhoneAuthProvider>(context);
    final TextEditingController _phoneController = TextEditingController();

    void onTabLogin() {
      String enteredPhone = _phoneController.text.trim();
      authProvider.authenticated(enteredPhone);

      if (authProvider.isAuthenticated) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const AppViewScreen(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const AuthProfileInfo(),
          ),
        );
      }
    }

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
            // telefon numarası girme alanı
            PhoneInputButton(phoneController: _phoneController),
            const SizedBox(height: 20),
            // ilerleme alanı
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  onTabLogin();
                },
                child: const Text(
                  "Devam Edin",
                  style: TextStyle(
                    color: Colors.white, // Yazı rengi beyaz
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            _rickTextMethod(context),
            const Spacer(
              flex: 3,
            ),
            Image.asset(
              'assets/image/dynamic.png',
              width: 100,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  RichText _rickTextMethod(BuildContext context) {
    return RichText(
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
    );
  }
}
