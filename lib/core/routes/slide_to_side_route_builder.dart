import 'package:flutter/material.dart';

import '../../shared/domain/entities/dto/pokemon_route_params_dto.dart';

class SlideToSideRouteBuilder {
  static Route<dynamic> buildRoute({
    required Widget widget,
    required RouteSettings settings,
    required TransitionType transitionType,
  }) {
    if (transitionType == TransitionType.normal) {
      return MaterialPageRoute(
        builder: (_) => widget,
        settings: settings,
      );
    }

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final Offset begin;

        if (transitionType == TransitionType.toRight) {
          begin = const Offset(0.6, 0.0);
        } else {
          begin = const Offset(-0.6, 0.0);
        }

        final tween = Tween(begin: begin, end: Offset.zero).chain(CurveTween(curve: Curves.ease));

        return SlideTransition(
          position: animation.drive(tween),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
    );
  }
}
