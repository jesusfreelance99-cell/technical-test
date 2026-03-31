import 'package:flutter/material.dart';
import 'package:pokemonapp/features/pokemon/presentation/widgets/gradient_effect_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GradientEffectForScreens(child: ListView(children: [
          
        ],
      ));
  }
}
