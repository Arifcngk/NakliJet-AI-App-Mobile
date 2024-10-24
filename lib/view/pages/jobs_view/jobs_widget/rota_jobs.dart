import 'package:flutter/material.dart';

class RotaJobsWidget extends StatelessWidget {
  const RotaJobsWidget({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.circle,
              color: Theme.of(context).colorScheme.primary,
              size: 15,
            ),
            const SizedBox(width: 5),
            const Text(
              'Çıkış',
              style: TextStyle(
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
        const Row(
          children: [
            Icon(
              Icons.circle,
              color: Colors.blue,
              size: 15,
            ),
            SizedBox(width: 5),
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
    );
  }
}
