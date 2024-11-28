import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneInputButton extends StatelessWidget {
  const PhoneInputButton({
    super.key,
    required this.phoneController,
  });

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      keyboardType: TextInputType.phone,
      controller: phoneController,
      decoration: InputDecoration(
        hintText: '(5XX) XXX XXX',
        labelStyle: const TextStyle(
          fontSize: 16,
          color: Colors.black, // Label yazısı siyah
        ),
        hintStyle: const TextStyle(
          color: Colors.grey, // Örnek gösterim yazısı gri
        ),
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
        // Telefon numarası her değiştiğinde yapılacak işlemler
      },
      style: const TextStyle(
        fontSize: 16, // Telefon numarası metni boyutu
      ),
    );
  }
}
