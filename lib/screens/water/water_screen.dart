import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/constants/app_colors.dart';
import '../../models/water_model.dart';
import '../../services/water_service.dart';
import 'widgets/water_button.dart';

class WaterScreen extends StatefulWidget {
  const WaterScreen({super.key});

  @override
  State<WaterScreen> createState() => _WaterScreenState();
}

class _WaterScreenState extends State<WaterScreen> {
  final WaterService service = WaterService();

  List<WaterModel> history = [];
  int totalWater = 0;

  static const int dailyGoal = 3000;

  @override
  void initState() {
    super.initState();
    loadWater();
  }

  Future<void> loadWater() async {
    history = await service.getWaterHistory();
    totalWater = await service.getTodayTotal();

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> addWater(int amount) async {
    await service.insertWater(
      WaterModel(
        amount: amount,
        date: DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()),
      ),
    );

    await loadWater();
  }

  Future<void> resetWater() async {
    await service.deleteAllWater();
    await loadWater();
  }

  @override
  Widget build(BuildContext context) {
    final progress =
        (totalWater / dailyGoal).clamp(0.0, 1.0);

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text("Water Tracker"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "${(totalWater / 1000).toStringAsFixed(2)} / 3.00 L",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            LinearProgressIndicator(
              value: progress,
              minHeight: 10,
            ),

            const SizedBox(height: 30),

            Row(
              children: [
                WaterButton(
                  label: "+250",
                  onTap: () => addWater(250),
                ),
                const SizedBox(width: 10),
                WaterButton(
                  label: "+500",
                  onTap: () => addWater(500),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                WaterButton(
                  label: "+1000",
                  onTap: () => addWater(1000),
                ),
                const SizedBox(width: 10),
                WaterButton(
                  label: "Reset",
                  onTap: resetWater,
                ),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              "Today's History",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: history.isEmpty
                  ? const Center(
                      child: Text(
                        "No water intake yet",
                        style: TextStyle(color: Colors.white70),
                      ),
                    )
                  : ListView.builder(
                      itemCount: history.length,
                      itemBuilder: (context, index) {
                        final item = history[index];

                        return Card(
                          color: AppColors.card,
                          child: ListTile(
                            leading: const Icon(
                              Icons.water_drop,
                              color: Colors.cyan,
                            ),
                            title: Text(
                              "${item.amount} ml",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            subtitle: Text(
                              item.date,
                              style: const TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}