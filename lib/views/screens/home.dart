import 'package:flutter/material.dart';
import '../../routes/routes.dart';
import '../animations/gradient_container.dart';
import '../animations/shiny_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background gradient container
          GradientContainer(
            radius: BorderRadius.circular(20),
            glow: 1,
            width: screenWidth,
            height: screenHeight,
            glowColors: [
              Colors.blueAccent,
              Colors.purpleAccent,
              Colors.redAccent,
              Colors.greenAccent
            ],
          ),

          // Page content
          SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header section
                  Center(
                    child: Text(
                      'Welcome to Designs Template App!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Intro text
                  Text(
                    'This app is a public collection of awesome designs, animations, and effects you can reuse freely!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Features section
                  Text(
                    'Features',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ..._buildFeatureList(),

                  const SizedBox(height: 20),

                  // Sample Animations Section
                  Text(
                    'Sample Animations',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ..._buildAnimationList(),
                  // Get Started Button
                  const SizedBox(height: 20),

                  const Center(
                    child: ShinyButton(
                      route: AppRoutes.animationList,
                      borderRadius: 25,
                      height: 60,
                      width: 200,
                      text: 'Get Started',
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build a list of features
  List<Widget> _buildFeatureList() {
    final features = [
      'Customizable UI elements',
      'Neon glow effects',
      'Smooth animations',
      'Reusable widgets',
      'Cross-platform compatibility',
    ];

    return features.map((feature) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(Icons.check, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                feature,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  // Helper method to build a list of sample animations
  List<Widget> _buildAnimationList() {
    final animations = [
      'Bouncing Button',
      'Pulse Effect',
      'Fading Text',
      'Sliding Cards',
      'Rotating Icons',
    ];

    return animations.map((animation) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(Icons.animation, color: Colors.blueAccent),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                animation,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
