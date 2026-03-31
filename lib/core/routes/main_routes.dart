import 'package:flutter/material.dart';
import 'package:pokemonapp/features/pokemon/presentation/screens/home_screen.dart';

class MainRoutes {
  static const String home = '/';

  static Map<String, WidgetBuilder> get routes {
    return {home: (context) => const HomeScreen()};
  }
}
