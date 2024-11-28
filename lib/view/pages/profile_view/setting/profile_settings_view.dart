import 'package:flutter/material.dart';
import 'package:naklijet_demo/widget/circle_avatar_widget.dart';
import 'package:unicons/unicons.dart';

class ProfileSettingsView extends StatelessWidget {
  const ProfileSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(UniconsLine.arrow_left, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 15),
              const CircleAvatar(
                radius: 55,
                backgroundColor: Colors.white,
                child: CircleAvatarWidget(
                  radius: 50,
                  icon: UniconsLine.user_circle,
                  iconSize: 55,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Arif Can Gök',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'ÜYE ID 2256',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.withOpacity(0.9),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
