import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({Key? key, required this.label}) : super(key: key);
  final Widget label;
  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Colors.orange.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      side: BorderSide(
        width: 0.2,
        color: Colors.orange,
      ),
      label: label,
    );
  }
}
