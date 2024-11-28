import 'package:flutter/material.dart';

class EmptyChooseWidget extends StatelessWidget {
  final String text;
  const EmptyChooseWidget({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/image/choose.png"),
         Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}