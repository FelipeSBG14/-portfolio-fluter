import 'package:flutter/material.dart';

class SectionMenu extends StatelessWidget {
  final Color color;
  final double height;
  const SectionMenu({super.key, required this.color, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: height,
    );
  }
}
