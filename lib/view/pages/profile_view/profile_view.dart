import 'package:flutter/material.dart';
import 'package:naklijet_demo/view/pages/profile_view/setting/profile_settings_view.dart';
import 'package:naklijet_demo/widget/circle_avatar_widget.dart';
import 'package:unicons/unicons.dart';

class ProfileViewScreen extends StatelessWidget {
  const ProfileViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEDEB),
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InfoProfile(),
              const SizedBox(height: 20),
              _buildSectionTitle('Menü'),
              _buildCard(
                [
                  _buildListTile(
                    icon: UniconsLine.luggage_cart,
                    title: 'İşlerim',
                  ),
                  _buildListTile(
                    icon: UniconsLine.truck,
                    title: 'Araçlarım',
                  ),
                  _buildListTile(
                    icon: UniconsLine.money_bill,
                    title: 'Kazançlarım',
                  ),
                  _buildListTile(
                    icon: UniconsLine.megaphone,
                    title: 'Duyurular',
                  ),
                ],
              ),
              const SizedBox(height: 15),
              _buildSectionTitle('Ayarlar'),
              _buildCard(
                [
                  _buildListTile(
                    icon: UniconsLine.setting,
                    title: 'Profil Ayarları',
                  ),
                  _buildListTile(
                    icon: UniconsLine.file_minus_alt,
                    title: 'Belgeler',
                  ),
                  _buildListTile(
                    icon: UniconsLine.university,
                    title: 'Ödeme Bilgileri',
                  ),
                  _buildListTile(
                    icon: UniconsLine.bill,
                    title: 'Fatura Bilgileri',
                  ),
                  _buildListTile(
                    icon: UniconsLine.bell,
                    title: 'Bildirim İzinleri',
                  ),
                ],
              ),
              const SizedBox(height: 15),
              _buildSectionTitle('Yardım'),
              _buildCard(
                [
                  _buildListTile(
                    icon: UniconsLine.info_circle,
                    title: 'Hakkımızda',
                  ),
                  _buildListTile(
                    icon: UniconsLine.question_circle,
                    title: 'Sık Sorulan Sorular',
                  ),
                  _buildListTile(
                    icon: UniconsLine.shield_check,
                    title: 'Sözleşmeler',
                  ),
                  _buildListTile(
                    icon: UniconsLine.signout,
                    title: 'Çıkış Yap',
                    iconColor: Colors.red,
                    titleColor: Colors.red,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // AppBar yapısını fonksiyona ayırdık
  PreferredSize _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: Column(
        children: [
          AppBar(
            centerTitle: true,
            title: const Text(
              "Profilim",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          Container(
            height: 0.2,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  // ListTile için fonksiyon oluşturduk
  ListTile _buildListTile({
    required IconData icon,
    required String title,
    Color? iconColor,
    Color? titleColor,
  }) {
    return ListTile(
      onTap: () {},
      leading: Icon(icon, color: iconColor ?? Colors.black),
      title: Text(
        title,
        style: TextStyle(color: titleColor ?? Colors.black),
      ),
      trailing: const Icon(UniconsLine.angle_right_b),
    );
  }

  // Kart yapısı için bir fonksiyon oluşturduk
  Card _buildCard(List<ListTile> listTiles) {
    return Card(
      color: Colors.white,
      child: Column(children: listTiles),
    );
  }

  // Başlık bölümlerini oluşturan fonksiyon
  Padding _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}

// Profil kısmını bileşen olarak ayırdık
class InfoProfile extends StatelessWidget {
  const InfoProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatarWidget(
            icon: UniconsLine.user_circle,
            radius: 30,
          ),
          const SizedBox(width: 15),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Arif Can Gök',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(
                  '+05355553432',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              // Profil düzenleme sayfasına yönlendirme yapılacak
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileSettingsView(),
                ),
              );
            },
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              child: Icon(
                UniconsLine.edit,
                size: 18,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
