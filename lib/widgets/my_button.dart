import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const MyButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 129, 174, 214),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: 
            Text(text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.white
            ),
            ),
          ),
        ),
      ),
    );
  }
}