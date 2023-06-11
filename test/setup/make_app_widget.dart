import 'package:flutter/material.dart';
import 'package:poke_app/core/routes/app_routes.dart';
import 'package:poke_app/core/routes/route_names.dart';

MaterialApp makeAppWidget(
  Widget? child, {
  bool defaultConfig = true,
}) =>
    MaterialApp(
      title: 'Poke App',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: defaultConfig ? AppRoutes.generateRoute : null,
      initialRoute: defaultConfig ? RouteNames.home : null,
      home: defaultConfig ? null : child,
    );
