import 'package:flutter/material.dart';
import '../../modules/details/presentation/view/screens/pokemon_details_screen.dart';
import '../../modules/home/presentation/view/screens/home_screen.dart';
import 'route_names.dart';

class AppRoutes {
  static MaterialPageRoute<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );

      case RouteNames.details:
        return MaterialPageRoute(
          builder: (_) => PokemonDetailsScreen(pokemonId: settings.arguments as int),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
          settings: settings,
        );
    }
  }
}
