import 'package:flutter/material.dart';
import 'package:naklijet_demo/app/theme.dart';
import 'package:naklijet_demo/providers/advertisement_info_provider.dart';
import 'package:naklijet_demo/providers/phone_auth_provider.dart';
import 'package:naklijet_demo/view/auth/login_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => PhoneAuthProvider()),
      ChangeNotifierProvider(create: (context) => AdvertisementInformationProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Naklijet Demo',
        theme: ThemeApp.lightTheme,
        home: const LoginViewSceen(),
      ),
    );
  }
}
