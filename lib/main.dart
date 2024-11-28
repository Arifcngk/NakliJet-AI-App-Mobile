import 'package:flutter/material.dart';
import 'package:naklijet_demo/app/theme.dart';
import 'package:naklijet_demo/core/utils/shared_preferences_helper.dart';
import 'package:naklijet_demo/providers/advertisement_info_provider.dart';
import 'package:naklijet_demo/providers/phone_auth_provider.dart';
import 'package:naklijet_demo/view/app_view.dart';
import 'package:naklijet_demo/view/auth/login_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => PhoneAuthProvider()),
      ChangeNotifierProvider(
          create: (context) => AdvertisementInformationProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Naklijet Demo',
        theme: ThemeApp.lightTheme,
        home: const SplashScreen(), // Splash ekranı başlangıç olarak ayarlandı
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkUserStatus(); // Kullanıcı durumunu kontrol et
  }

  Future<void> _checkUserStatus() async {
    // Kullanıcı oturum durumunu kontrol et
    bool isLoggedIn = await SharedPreferencesHelper.getLoginStatus();

    // Yönlendirme
    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AppViewScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginViewSceen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Yükleme animasyonu
      ),
    );
  }
}
