import 'package:flutter/material.dart';
import 'package:pokemonapp/core/theme/main_theme_export.dart';
import 'package:pokemonapp/core/routes/main_routes.dart';

import 'package:pokemonapp/core/di/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon App',
      debugShowCheckedModeBanner: false,
      theme: MainTheme.whiteTheme,
      routes: MainRoutes.routes,
    );
  }
}
