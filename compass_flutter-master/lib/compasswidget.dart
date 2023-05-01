import 'package:flutter/material.dart';

class CompassWidget extends StatelessWidget {
  final child;
  const CompassWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      margin: const EdgeInsets.all(40),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white60,
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              blurRadius: 15.0,
              spreadRadius: 1.0),
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white70,
            Colors.white54,
            // Colors.blueGrey.shade800,
          ],
        ),
      ),
      child: child,
    );
  }
}