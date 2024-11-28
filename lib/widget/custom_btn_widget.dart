import 'package:flutter/material.dart';

class customBtnWidget extends StatelessWidget {
  final Function()? onPressed;

  const customBtnWidget({
    super.key,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: const Text(
          "Devam Edin",
          style: TextStyle(
            color: Colors.white, // Yazı rengi beyaz
          ),
        ),
      ),
    );
  }
}
