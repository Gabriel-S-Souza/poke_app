import 'package:flutter/material.dart';

import '../../modules/details/presentation/view/screens/pokemon_details_screen.dart';
import '../../modules/home/presentation/view/screens/home_screen.dart';
import '../../shared/domain/entities/dto/pokemon_route_params_dto.dart';
import 'route_names.dart';
import 'slide_to_side_route_builder.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );

      case RouteNames.details:
        final PokemonRouteParamsDTO routeParams = settings.arguments as PokemonRouteParamsDTO;
        final TransitionType transitionType = routeParams.transitionType;

        return SlideToSideRouteBuilder.buildRoute(
          widget: PokemonDetailsScreen(pokemonId: routeParams.id),
          transitionType: transitionType,
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
