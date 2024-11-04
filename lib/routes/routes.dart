import 'package:flutter/material.dart';

import '../views/screens/animation_list.dart';
import '../views/screens/home.dart';

// Import other screens as needed

class AppRoutes {
  static const String home = '/';
  static const String animationList = '/animationList';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => Home(),
    animationList: (context) => AnimationList(),
    // Add other routes here
  };
}
