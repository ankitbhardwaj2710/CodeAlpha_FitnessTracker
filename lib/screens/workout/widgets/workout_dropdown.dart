import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class WorkoutDropdown extends StatelessWidget {
  final String label;
  final String value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const WorkoutDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 8),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(15),
          ),

          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,

              dropdownColor: AppColors.card,

              isExpanded: true,

              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),

              iconEnabledColor: Colors.white,

              onChanged: onChanged,

              items: items
                  .map(
                    (item) => DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}