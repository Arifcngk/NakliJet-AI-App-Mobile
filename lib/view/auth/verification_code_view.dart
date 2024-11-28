import 'dart:math';

import 'package:flutter/material.dart';
import 'package:naklijet_demo/core/utils/shared_preferences_helper.dart';
import 'package:naklijet_demo/view/app_view.dart';
import 'package:naklijet_demo/widget/circle_avatar_widget.dart';
import 'package:naklijet_demo/widget/custom_btn_widget.dart';

class VerificationCodeView extends StatefulWidget {
  const VerificationCodeView({super.key});

  @override
  State<VerificationCodeView> createState() => _VerificationCodeViewState();
}

class _VerificationCodeViewState extends State<VerificationCodeView> {
  // Random doğrulama kodu
  int generatedCode = 0;

  @override
  void initState() {
    super.initState();
    // 6 haneli rastgele bir doğrulama kodu üret
    generatedCode = generateRandomSixDigitNumber();
  }

  int generateRandomSixDigitNumber() {
    Random random = Random();
    // 100000 ile 999999 arasında rastgele bir sayı üretir
    return 100000 + random.nextInt(900000);
  }

  @override
  Widget build(BuildContext context) {
    // TextEditingController'lar ile her bir kutuyu kontrol edeceğiz
    TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    TextEditingController controller3 = TextEditingController();
    TextEditingController controller4 = TextEditingController();
    TextEditingController controller5 = TextEditingController();
    TextEditingController controller6 = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            const CircleAvatarWidget(
              icon: Icons.security_sharp,
              radius: 50,
              iconSize: 50,
            ),
            const SizedBox(height: 30),
            const Text(
              'Lütfen 6 haneli doğrulama kodunu girin.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              'Üretilen random sayınız: $generatedCode', // Üretilen kodu ekliyoruz
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCodeInputField(controller1, context),
                const SizedBox(width: 10),
                _buildCodeInputField(controller2, context),
                const SizedBox(width: 10),
                _buildCodeInputField(controller3, context),
                const SizedBox(width: 10),
                _buildCodeInputField(controller4, context),
                const SizedBox(width: 10),
                _buildCodeInputField(controller5, context),
                const SizedBox(width: 10),
                _buildCodeInputField(controller6, context),
              ],
            ),
            const SizedBox(height: 30),
            customBtnWidget(
              onPressed: () {
                // Kodları al ve doğrulama işlemi yap
                String verificationCode = controller1.text +
                    controller2.text +
                    controller3.text +
                    controller4.text +
                    controller5.text +
                    controller6.text;

                if (verificationCode.length == 6) {
                  // Kullanıcı kodunu doğru girmişse
                  if (int.parse(verificationCode) == generatedCode) {
                    SharedPreferencesHelper.setLoginStatus(true);
                    // Eğer doğruysa, AppViewScreen'e geç
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AppViewScreen()),
                    );
                  } else {
                    // Yanlışsa, kullanıcıya hata mesajı göster
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Geçersiz doğrulama kodu!',
                          textAlign: TextAlign.center,
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                } else {
                  // Hata mesajı
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Lütfen geçerli bir 6 haneli kod girin.',
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
            ),
            const Spacer(flex: 3)
          ],
        ),
      ),
    );
  }

  // Kod giriş alanını oluşturuyoruz
  Widget _buildCodeInputField(
      TextEditingController controller, BuildContext context) {
    return SizedBox(
      width: 50,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: '',
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ),
        style: const TextStyle(fontSize: 24),
        onChanged: (value) {
          // Otomatik olarak bir sonraki kutuya geçmek için
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
