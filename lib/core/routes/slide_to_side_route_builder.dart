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
        const Curve curve = Curves.ease;
        const Offset end = Offset.zero;
        final Offset begin;
        Animatable<Offset> tween;

        if (transitionType == TransitionType.toRight) {
          begin = const Offset(0.6, 0.0);
          tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        } else {
          begin = const Offset(-0.6, 0.0);
          tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        }

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
