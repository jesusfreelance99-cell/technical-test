import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemonapp/features/pokemon/presentation/bloc/pokemon_list_bloc.dart';
import 'package:pokemonapp/features/pokemon/presentation/bloc/pokemon_list_event.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<PokemonListBloc>()..add(const GetPokemonsEvent()),
      child: MaterialApp(
        title: 'Pokemon App',
        debugShowCheckedModeBanner: false,
        theme: MainTheme.whiteTheme,
        routes: MainRoutes.routes,
      ),
    );
  }
}
