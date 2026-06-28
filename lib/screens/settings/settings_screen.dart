import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../providers/theme_provider.dart';
import '../bmi/bmi_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          // ==========================
          // 🌙 Dark Mode
          // ==========================

          Card(
            color: AppColors.card,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Consumer<ThemeProvider>(
              builder: (context, provider, child) {
                return SwitchListTile(
                  secondary: const Icon(
                    Icons.dark_mode,
                    color: Colors.amber,
                  ),
                  title: const Text(
                    "Dark Mode",
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: const Text(
                    "Enable / Disable Theme",
                    style: TextStyle(color: Colors.white70),
                  ),
                  value: provider.isDark,
                  onChanged: (value) {
                    provider.toggleTheme(value);
                  },
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          // ==========================
          // BMI Calculator
          // ==========================

          Card(
            color: AppColors.card,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: const Icon(
                Icons.monitor_weight,
                color: Colors.orange,
              ),
              title: const Text(
                "BMI Calculator",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: const Text(
                "Calculate your Body Mass Index",
                style: TextStyle(color: Colors.white70),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white70,
                size: 18,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const BMIScreen(),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          // ==========================
          // Version
          // ==========================

          Card(
            color: AppColors.card,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: const ListTile(
              leading: Icon(
                Icons.info_outline,
                color: Colors.blue,
              ),
              title: Text(
                "App Version",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                "v1.0.0",
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ),
        ],
      ),
    );
  }
}