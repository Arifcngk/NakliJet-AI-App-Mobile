import 'package:flutter/material.dart';

class CircleAvatarWidget extends StatelessWidget {
  final double radius;
  final IconData icon;
  const CircleAvatarWidget({
    super.key, required this.radius, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.blue.shade300,
      radius: radius,
      child: Icon(
       icon,
        size: 28,
        color: Colors.white.withOpacity(0.8),
      ),
    );
  }
}
