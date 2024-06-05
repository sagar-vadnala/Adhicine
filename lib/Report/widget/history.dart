import 'package:flutter/material.dart';

class CheckHistory extends StatelessWidget {
  const CheckHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Check History',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(6, (index) {
            return DayCircle(day: (index + 1).toString(), isSelected: index == 0);
          }),
        ),
      ],
    );
  }
}


class DayCircle extends StatelessWidget {
  final String day;
  final bool isSelected;

  const DayCircle({super.key, required this.day, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          day,
          style: TextStyle(color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}