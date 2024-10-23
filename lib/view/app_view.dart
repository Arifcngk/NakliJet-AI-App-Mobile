import 'package:flutter/material.dart';
import 'package:naklijet_demo/view/pages/home_view/home_view.dart';
import 'package:naklijet_demo/view/pages/jobs_view/jobs_view.dart';
import 'package:naklijet_demo/view/pages/my_cars_view/my_cars_view.dart';
import 'package:naklijet_demo/view/pages/post_flow_view/post_flow_view.dart';
import 'package:naklijet_demo/view/pages/profile_view/profile_view.dart';
import 'package:unicons/unicons.dart';

class AppViewScreen extends StatefulWidget {
  const AppViewScreen({Key? key}) : super(key: key);

  @override
  _AppViewScreenState createState() => _AppViewScreenState();
}

class _AppViewScreenState extends State<AppViewScreen> {
  int _currentIndex = 0;

  // Sayfalar listesi
  final List<Widget> _pages = [
    const HomeViewScreen(),
    const JobsViewScreen(),
    const PostFlowViewScreen(), // Ortadaki sayfa
    const MyCarsViewScreen(),
    const ProfileViewScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory, // Basma efektini kapatma
          highlightColor: Colors.transparent, // Highlight rengini kaldırma
          splashColor: Colors.transparent, // Splash rengini kaldırma
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(UniconsLine.estate),
              label: 'Anasayfa',
            ),
            const BottomNavigationBarItem(
              icon: Icon(UniconsLine.luggage_cart),
              label: 'İşlerim',
            ),
            BottomNavigationBarItem(
              // Ortadaki butonu özel olarak tasarlıyoruz
              icon: Stack(
                alignment: Alignment.center,
                children: [
                  // Mavi daire
                  CircleAvatar(
                    radius: 30, // Dairenin büyüklüğü
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  // İkonu ortasına yerleştir
                  const Icon(UniconsLine.search_plus,
                      color: Colors.white, size: 30),
                ],
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(UniconsLine.truck),
              label: 'Araçlarım',
            ),
            const BottomNavigationBarItem(
              icon: Icon(UniconsLine.user_circle),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}
