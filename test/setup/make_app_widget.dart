import 'package:flutter/material.dart';
import 'package:poke_app/core/routes/app_routes.dart';
import 'package:poke_app/core/routes/route_names.dart';
import 'package:poke_app/shared/presentation/toast/controller/toast.dart';
import 'package:poke_app/shared/presentation/toast/view/toast_zone.dart';

Widget makeAppWidget({
  Widget? child,
  bool defaultConfig = true,
}) =>
    Stack(
      textDirection: TextDirection.ltr,
      children: [
        MaterialApp(
          title: 'Poke App',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: defaultConfig ? AppRoutes.generateRoute : null,
          initialRoute: defaultConfig ? RouteNames.home : null,
          home: defaultConfig ? null : child,
        ),
        const ToastZone(
          behavior: ToastBehavior.pinnedDown,
        ),
      ],
    );
