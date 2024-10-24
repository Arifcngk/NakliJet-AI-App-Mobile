import 'package:flutter/material.dart';
import 'package:naklijet_demo/app/theme.dart';
import 'package:naklijet_demo/view/app_view.dart';
import 'package:naklijet_demo/view/pages/jobs_view/jobs_details.dart';

void main() {
  runApp(const MyApp());
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
        home: const JobsDetailsScreen(),
      ),
    );
  }
}
