import 'package:flutter/material.dart';

class SelectableCircle extends StatefulWidget {
  final bool isCircleSelected;
  final Color color;
  final Function() onTap;
  const SelectableCircle({super.key, required this.isCircleSelected, required this.onTap, required this.color});

  @override
  State<SelectableCircle> createState() => _SelectableCircleState();
}

class _SelectableCircleState extends State<SelectableCircle> {
  Color get _containerColor {
    return widget.isCircleSelected ? Colors.lightBlue : Colors.red; // Or any desired default color
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: CircleAvatar(
        backgroundColor: _containerColor
      ),
    );
  }
}