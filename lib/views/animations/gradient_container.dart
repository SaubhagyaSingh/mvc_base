import 'package:flutter/material.dart';

class GradientContainer extends StatefulWidget {
  final double height;
  final double width;
  final Color backgroundColor;
  final double glow;
  final BorderRadiusGeometry radius;
  final List<Color> glowColors; // List of colors for the animation

  const GradientContainer({
    Key? key,
    required this.height,
    required this.width,
    required this.glow,
    required this.radius,
    required this.glowColors, // User-specified colors
    this.backgroundColor = Colors.black,
  }) : super(key: key);

  @override
  State<GradientContainer> createState() => _GradientContainerState();
}

class _GradientContainerState extends State<GradientContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    )..repeat();

    // Create a TweenSequence to cycle through the specified colors
    _colorAnimation = TweenSequence<Color?>(
      [
        for (int i = 0; i < widget.glowColors.length; i++)
          TweenSequenceItem(
            tween: ColorTween(
              begin: widget.glowColors[i],
              end: widget.glowColors[(i + 1) % widget.glowColors.length],
            ),
            weight: 1.0,
          ),
      ],
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                _colorAnimation.value!.withOpacity(0.1),
                widget.backgroundColor,
              ],
              radius: widget.glow,
              center: Alignment.center,
            ),
            borderRadius: widget.radius,
            boxShadow: [
              BoxShadow(
                color: _colorAnimation.value!.withOpacity(0.6),
                blurRadius: widget.glow * 4,
                spreadRadius: widget.glow,
              ),
              BoxShadow(
                color: _colorAnimation.value!.withOpacity(0.4),
                blurRadius: widget.glow * 2,
                spreadRadius: widget.glow / 2,
              ),
            ],
          ),
          padding: const EdgeInsets.all(20),
        );
      },
    );
  }
}
