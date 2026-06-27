import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../widgets/info_card.dart';
import '../../widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(20),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  Column(

                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: const [

                      Text(
                        "Good Morning 👋",
                        style: TextStyle(
                          color: AppColors.grey,
                          fontSize: 16,
                        ),
                      ),

                      SizedBox(height: 5),

                      Text(
                        "Ankit",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const CircleAvatar(
                    radius: 26,
                    backgroundColor: AppColors.primary,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  )

                ],

              ),

              const SizedBox(height:30),

              Container(

                width: double.infinity,

                padding: const EdgeInsets.all(22),

                decoration: BoxDecoration(

                  color: AppColors.card,

                  borderRadius: BorderRadius.circular(25),

                ),

                child: const Column(

                  children: [

                    Text(
                      "Today's Goal",
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize:16,
                      ),
                    ),

                    SizedBox(height:15),

                    Text(
                      "78%",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:42,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height:10),

                    LinearProgressIndicator(
                      value: .78,
                      minHeight:8,
                      backgroundColor: Colors.black26,
                    ),

                  ],

                ),

              ),

              const SizedBox(height:30),

              const SectionTitle(
                title: "Today's Activity",
              ),

              const SizedBox(height:18),

              GridView.count(

                physics: const NeverScrollableScrollPhysics(),

                shrinkWrap: true,

                crossAxisCount: 2,

                crossAxisSpacing: 15,

                mainAxisSpacing: 15,

                childAspectRatio: 1.15,

                children: const [

                  InfoCard(
                    title: "Steps",
                    value: "8,240",
                    icon: Icons.directions_walk,
                    color: Colors.deepPurple,
                  ),

                  InfoCard(
                    title: "Calories",
                    value: "620",
                    icon: Icons.local_fire_department,
                    color: Colors.orange,
                  ),

                  InfoCard(
                    title: "Water",
                    value: "2.5 L",
                    icon: Icons.water_drop,
                    color: Colors.cyan,
                  ),

                  InfoCard(
                    title: "Workout",
                    value: "55 Min",
                    icon: Icons.fitness_center,
                    color: Colors.green,
                  ),

                ],

              ),

              const SizedBox(height:30),

              const SectionTitle(
                title: "Today's Challenge",
              ),

              const SizedBox(height:15),

              Container(

                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(

                  color: AppColors.card,

                  borderRadius: BorderRadius.circular(20),

                ),

                child: const Row(

                  children: [

                    Icon(
                      Icons.flag,
                      color: Colors.amber,
                    ),

                    SizedBox(width:15),

                    Expanded(

                      child: Text(

                        "Walk 10,000 Steps Today",

                        style: TextStyle(

                          color: Colors.white,

                          fontSize:16,

                        ),

                      ),

                    ),

                  ],

                ),

              ),

            ],

          ),

        ),

      ),

    );

  }

}