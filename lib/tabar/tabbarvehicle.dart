import 'package:flutter/material.dart';

class TabBarVehicle extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const TabBarVehicle({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: isSelected ? Colors.black : Color.fromRGBO(185, 190, 190, 1),
            borderRadius: BorderRadius.circular(5)),
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
