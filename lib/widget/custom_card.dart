import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Sipariş Numarası
                Text(
                  '39479',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                // Tarih ve Fiyat
                Row(
                  children: [
                    // Tarih
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.pink.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Icon(UniconsLine.calendar_alt, color: Colors.purple),
                          SizedBox(width: 5),
                          Text(
                            '21 Ekim 2024',
                            style: TextStyle(color: Colors.purple),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Fiyat
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Text(
                            '₺₺₺₺₺ + KDV',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),

            Divider(color: Colors.grey.shade300),
            const SizedBox(height: 15),
            // Çıkış ve Varış Bilgileri
            Row(
              children: [
                Column(
                  children: [
                    Icon(Icons.circle,
                        size: 12, color: Theme.of(context).colorScheme.primary),
                    Container(
                      width: 2,
                      height: 30,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    Icon(Icons.circle_outlined,
                        size: 12, color: Theme.of(context).colorScheme.primary),
                  ],
                ),
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Çıkış',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Manisa Yunusemre',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Text(
                          'Varış',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'İstanbul Anadolu, Sancaktepe',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
