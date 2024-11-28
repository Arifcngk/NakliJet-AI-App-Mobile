import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class CustomCard extends StatelessWidget {
  final String id;

  final String startPlace;
  final String finishPlace;
  final String advertDate;
  final int advertPrice;

  const CustomCard({
    super.key,
    required this.id,
    required this.startPlace,
    required this.finishPlace,
    required this.advertDate,
    required this.advertPrice,
  });

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
                  id,
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
                      child: Row(
                        children: [
                          const Icon(UniconsLine.calendar_alt,
                              color: Colors.purple),
                          const SizedBox(width: 5),
                          Text(
                            advertDate,
                            style: const TextStyle(color: Colors.purple),
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
                      child: Row(
                        children: [
                          Text(
                            '{$advertPrice} + KDV',
                            style: const TextStyle(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          startPlace,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Manisa Yunusemre',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Text(
                          finishPlace,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
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
