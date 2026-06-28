import 'package:flutter/material.dart';

class WaterButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const WaterButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 55,
        child: ElevatedButton(
          onPressed: onTap,
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}