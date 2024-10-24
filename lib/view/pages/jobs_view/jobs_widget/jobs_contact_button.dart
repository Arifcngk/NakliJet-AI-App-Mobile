import 'package:flutter/material.dart';

class JobsContactButton extends StatelessWidget {
  const JobsContactButton({
    super.key,
    required this.icon,
    required this.color,
  });

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.white,
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}