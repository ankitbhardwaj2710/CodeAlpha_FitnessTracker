import 'package:flutter/material.dart';

class CircularProgressCard extends StatelessWidget {
  final String title;
  final double progress;
  final String value;
  final IconData icon;

  const CircularProgressCard({
    super.key,
    required this.title,
    required this.progress,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [

            Icon(
              icon,
              size: 35,
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: 90,
              height: 90,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 8,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(title),

          ],
        ),
      ),
    );
  }
}