import 'package:flutter/material.dart';

class ResizableDot extends StatelessWidget {
  final double size;
  final String status;

  const ResizableDot({
    super.key,
    required this.size,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color color;

    switch (status.toLowerCase()) {
      case 'dead':
        color = Colors.red;
        break;
      case 'alive':
        color = Colors.green;
        break;
      default:
        color = Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black;
    }

    return Container(
      margin: const EdgeInsets.only(right: 7),
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}