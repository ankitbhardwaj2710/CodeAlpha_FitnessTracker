import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../services/water_service.dart';
import '../../../services/notification_service.dart';

class WaterCard extends StatefulWidget {
  const WaterCard({super.key});

  @override
  State<WaterCard> createState() => _WaterCardState();
}

class _WaterCardState extends State<WaterCard> {
  final WaterService _service = WaterService();

  int water = 0;
  static const int goal = 3000;

  @override
  void initState() {
    super.initState();
    _loadWater();
  }

  Future<void> _loadWater() async {
    final total = await _service.getTodayWater();

    if (!mounted) return;

    setState(() {
      water = total;
    });
  }

 Future<void> _addWater(int amount) async {
  print("Button Pressed");

  await _service.addQuickWater(amount);

  print("Water Saved");

  await _loadWater();

  print("Showing Notification");

  await NotificationService.showNotification(
    title: "Great Job! 💧",
    body: "$amount ml water added successfully.",
  );
}

  @override
  Widget build(BuildContext context) {
    final progress = (water / goal).clamp(0.0, 1.0);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.water_drop,
            color: Colors.blue,
            size: 50,
          ),

          const SizedBox(height: 10),

          Text(
            "$water / $goal ml",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          LinearProgressIndicator(
            value: progress,
            minHeight: 10,
            borderRadius: BorderRadius.circular(20),
          ),

          const SizedBox(height: 10),

          Text(
            "${(progress * 100).toStringAsFixed(0)}%",
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _addWater(250),
                  child: const Text("+250 ml"),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: ElevatedButton(
                  onPressed: () => _addWater(500),
                  child: const Text("+500 ml"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}