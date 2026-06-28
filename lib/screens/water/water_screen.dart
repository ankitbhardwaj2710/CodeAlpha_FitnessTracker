import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../models/water_model.dart';
import '../../services/water_service.dart';
import 'add_water_screen.dart';

class WaterScreen extends StatefulWidget {
  const WaterScreen({super.key});

  @override
  State<WaterScreen> createState() => _WaterScreenState();
}

class _WaterScreenState extends State<WaterScreen> {
  final WaterService service = WaterService();

  List<WaterModel> waterList = [];
  int todayWater = 0;

  @override
  void initState() {
    super.initState();
    loadWater();
  }

  Future<void> loadWater() async {
    final list = await service.getWaterEntries();
    final total = await service.getTodayWater();

    setState(() {
      waterList = list;
      todayWater = total;
    });
  }

  Future<void> deleteWater(int id) async {
    await service.deleteWater(id);
    loadWater();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text("Water Tracker"),
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddWaterScreen(),
            ),
          );

          if (result == true) {
            loadWater();
          }
        },
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            Container(
              width: double.infinity,
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
                    size: 45,
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "$todayWater ml",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    "Today's Water Intake",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),

                ],
              ),
            ),

            const SizedBox(height: 25),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "History",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: waterList.isEmpty
                  ? const Center(
                      child: Text(
                        "No Water Added Yet 💧",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: waterList.length,
                      itemBuilder: (context, index) {

                        final water = waterList[index];

                        return Card(
                          color: AppColors.card,
                          child: ListTile(
                            leading: const CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Icon(
                                Icons.water_drop,
                                color: Colors.white,
                              ),
                            ),

                            title: Text(
                              "${water.amount} ml",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),

                            subtitle: Text(
                              water.dateTime.toString(),
                              style: const TextStyle(
                                color: Colors.white60,
                              ),
                            ),

                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                deleteWater(water.id!);
                              },
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