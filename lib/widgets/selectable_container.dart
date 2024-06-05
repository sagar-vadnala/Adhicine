import 'package:flutter/material.dart';

class SelectableContainer extends StatefulWidget {
  final bool isSelected;
  final String text;
  final Function() onTap;

  const SelectableContainer({
    super.key,
    required this.isSelected,
    required this.text,
    required this.onTap,
  });

  @override
  State<SelectableContainer> createState() => _SelectableContainerState();
}

class _SelectableContainerState extends State<SelectableContainer> {
  Color get _containerColor {
    return widget.isSelected ? const Color.fromARGB(255, 131, 193, 243) : Colors.white; // Or any desired default color
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 50,
        width: 40,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF3176AF),),
          borderRadius: BorderRadius.circular(8),
          color: _containerColor,
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: widget.isSelected ? Colors.black : Colors.grey, // Adjust text color based on selection
            ),
          ),
        ),
      ),
    );
  }
}