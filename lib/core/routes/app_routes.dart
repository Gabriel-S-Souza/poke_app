import 'package:flutter/material.dart';
import '../../modules/details/presentation/view/screens/pokemon_details_screen.dart';
import '../../modules/home/presentation/view/screens/home_screen.dart';
import '../../shared/domain/entities/dto/pokemon_route_params_dto.dart';
import 'route_names.dart';

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
        final PokeDetailsTransitionType transitionType = routeParams.transitionType;

        if (routeParams.transitionType == PokeDetailsTransitionType.normal) {
          return MaterialPageRoute(
            builder: (_) => PokemonDetailsScreen(pokemonId: routeParams.id),
            settings: settings,
          );
        }

        return PageRouteBuilder(
          settings: settings,
          reverseTransitionDuration: const Duration(milliseconds: 100),
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (context, animation, secondaryAnimation) =>
              PokemonDetailsScreen(pokemonId: routeParams.id),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const Offset end = Offset.zero;
            const Curve curve = Curves.ease;

            final Offset begin;

            Animatable<Offset> tween;
            if (transitionType == PokeDetailsTransitionType.toRight) {
              begin = const Offset(0.6, 0.0);
              tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            } else if (transitionType == PokeDetailsTransitionType.toLeft) {
              begin = const Offset(-0.6, 0.0);

              tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            } else {
              return child;
            }
          },
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
