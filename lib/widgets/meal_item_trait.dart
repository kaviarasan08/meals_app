import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({
    super.key,
    required this.icon,
    required this.meal,
  });

  final IconData icon;
  final String meal;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 17,
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          meal,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
