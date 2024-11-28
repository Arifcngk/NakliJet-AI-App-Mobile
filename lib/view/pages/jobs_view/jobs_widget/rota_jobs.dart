import 'package:flutter/material.dart';

class RotaJobsWidget extends StatelessWidget {
  final String startPlace;
  final String finishPlace;

  const RotaJobsWidget({
    super.key,
    required this.context,
    required this.startPlace,
    required this.finishPlace,
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
              "Çıkış Noktası",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              startPlace,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Icon(
              Icons.circle,
              color: Colors.blue,
              size: 15,
            ),
            const SizedBox(width: 5),
            const Text(
              "Varış Noktası",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              finishPlace,
              style: const TextStyle(
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
