import 'package:flutter/material.dart';

class StatsWidget extends StatelessWidget {
  const StatsWidget({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildStatistic('Followers',15 ),
            buildStatistic('Post', 12),
            buildStatistic('Following', 14),
          ],
        ),
      );

  Widget buildStatistic(String text, int value) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$value',
            style:const  TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 4),
          Text(
            text,
            style: TextStyle(color: Colors.white),
          )
        ],
      );
}
