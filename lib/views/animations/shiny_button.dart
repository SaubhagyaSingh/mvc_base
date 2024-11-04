import 'package:flutter/material.dart';

class ShinyButton extends StatefulWidget {
  final String route;
  final List<Color> colors;
  final double borderRadius;
  final double height;
  final double width;
  final String text;

  const ShinyButton({
    Key? key,
    required this.route,
    this.colors = const [
      Colors.deepPurpleAccent,
      Colors.blueAccent,
      Colors.greenAccent
    ],
    this.borderRadius = 20.0,
    this.height = 50.0,
    this.width = 150.0,
    this.text = 'Get Started',
  }) : super(key: key);

  @override
  _ShinyButtonState createState() => _ShinyButtonState();
}

class _ShinyButtonState extends State<ShinyButton>
    with TickerProviderStateMixin {
  late AnimationController _colorController;
  late AnimationController _hoverController;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _tiltAnimation;
  bool _isHovering = false;

  @override
  void initState() {
    super.initState();

    // Color change animation
    _colorController = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    )..repeat(reverse: false);

    // Define a sequence of colors
    _colorAnimation = _colorController.drive(
      TweenSequence<Color?>(
        widget.colors.asMap().entries.map((entry) {
          return TweenSequenceItem(
            tween: ColorTween(
              begin: entry.value,
              end: widget.colors[(entry.key + 1) % widget.colors.length],
            ),
            weight: 1.0,
          );
        }).toList(),
      ),
    );

    // Hover tilt and shine animation
    _hoverController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _tiltAnimation = Tween<double>(begin: 0, end: 0.1).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _colorController.dispose();
    _hoverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovering = true);
        _hoverController.forward();
      },
      onExit: (_) {
        setState(() => _isHovering = false);
        _hoverController.reverse();
      },
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, widget.route),
        child: AnimatedBuilder(
          animation: Listenable.merge([_colorController, _hoverController]),
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..rotateZ(_isHovering ? _tiltAnimation.value : 0),
              child: Container(
                height: widget.height,
                width: widget.width,
                decoration: BoxDecoration(
                  color: _colorAnimation.value,
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  boxShadow: _isHovering
                      ? [
                          BoxShadow(
                            color: _colorAnimation.value!.withOpacity(0.8),
                            blurRadius: 15,
                            spreadRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ]
                      : [
                          BoxShadow(
                            color: _colorAnimation.value!.withOpacity(0.4),
                            blurRadius: 5,
                            spreadRadius: 1,
                          ),
                        ],
                ),
                child: Center(
                  child: Text(
                    widget.text,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
