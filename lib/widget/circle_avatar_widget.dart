import 'package:flutter/material.dart';

class CircleAvatarWidget extends StatelessWidget {
  final double radius;
  final IconData icon;
  final double iconSize;
  const CircleAvatarWidget({
    super.key,
    required this.radius,
    required this.icon,
    this.iconSize = 28,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.blue.shade300,
      radius: radius,
      child: Icon(
        icon,
        size: iconSize,
        color: Colors.white.withOpacity(0.8),
      ),
    );
  }
}
