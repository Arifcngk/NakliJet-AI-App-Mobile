import 'package:flutter/material.dart';

class JobsDateAndNo extends StatelessWidget {
  final String jobNo;
  final String jobDate;
  const JobsDateAndNo({
    super.key,
    required this.context,
    required this.jobNo,
    required this.jobDate,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Text(
              "Yük No : $jobNo",
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            const Spacer(),
            Text(
              "Tarih : $jobDate",
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
