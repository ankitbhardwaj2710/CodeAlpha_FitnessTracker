import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../models/water_model.dart';
import '../../services/water_service.dart';
import '../../widgets/custom_button.dart';

class AddWaterScreen extends StatefulWidget {
  const AddWaterScreen({super.key});

  @override
  State<AddWaterScreen> createState() => _AddWaterScreenState();
}

class _AddWaterScreenState extends State<AddWaterScreen> {
  final TextEditingController amountController = TextEditingController();

  final WaterService waterService = WaterService();

  bool isLoading = false;

  Future<void> saveWater() async {
    if (amountController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter water amount"),
        ),
      );
      return;
    }

    final int amount = int.parse(amountController.text);

    if (amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Amount must be greater than 0"),
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    await waterService.insertWater(
      WaterModel(
        amount: amount,
        dateTime: DateTime.now(),
      ),
    );

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });

    Navigator.pop(context, true);
  }

  void quickAdd(int value) {
    amountController.text = value.toString();
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  Widget quickButton(int value) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => quickAdd(value),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text(
          "$value ml",
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text("Add Water"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const SizedBox(height: 20),

            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Water (ml)",
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 25),

            Row(
              children: [
                quickButton(250),
                const SizedBox(width: 10),
                quickButton(500),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                quickButton(750),
                const SizedBox(width: 10),
                quickButton(1000),
              ],
            ),

            const Spacer(),

            isLoading
                ? const CircularProgressIndicator()
                : CustomButton(
                    text: "Save Water",
                    onPressed: saveWater,
                  ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}