import 'package:flutter/material.dart';
import 'package:naklijet_demo/view/pages/jobs_view/jobs_widget/jobs_contact_button.dart';
import 'package:naklijet_demo/widget/circle_avatar_widget.dart';
import 'package:unicons/unicons.dart';

class ContactCardWidget extends StatelessWidget {
  final String customerName;
  final String customerTitle;
  const ContactCardWidget({
    super.key,
    required this.customerName,
    required this.customerTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade100,
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.08,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              const CircleAvatarWidget(
                icon: UniconsLine.user_circle,
                radius: 26,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    customerName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    customerTitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Row(
                children: [
                  JobsContactButton(
                      icon: UniconsLine.whatsapp, color: Colors.green),
                  SizedBox(width: 10),
                  JobsContactButton(
                      icon: UniconsLine.phone, color: Colors.black),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
