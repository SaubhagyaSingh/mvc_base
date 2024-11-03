import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final double height;
  final double width;
  final Color backgroundColor;
  final Color glowColor;
  final double glow;
  final BorderRadiusGeometry radius;

  const GradientContainer({
    Key? key,
    required this.height,
    required this.width,
    required this.glow,
    required this.radius,
    this.backgroundColor = Colors.black,
    this.glowColor = Colors.blueAccent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        // Soft internal background color gradient
        gradient: RadialGradient(
          colors: [
            glowColor.withOpacity(0.1), // Soft glow color
            backgroundColor, // Center color for soft background
          ],
          radius: glow, // Controls spread of inner gradient
          center: Alignment.center,
        ),
        borderRadius: radius,
        // Neon glow border
        boxShadow: [
          BoxShadow(
            color: glowColor.withOpacity(0.6), // Outer glow
            blurRadius: glow * 4, // Adjust for neon effect
            spreadRadius: glow, // Spread for intensity
          ),
          BoxShadow(
            color: glowColor.withOpacity(0.4), // Inner glow
            blurRadius: glow * 2,
            spreadRadius: glow / 2,
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
    );
  }
}
