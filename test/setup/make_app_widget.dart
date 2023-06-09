import 'package:flutter/material.dart';
import 'package:poke_app/core/routes/app_routes.dart';
import 'package:poke_app/core/routes/route_names.dart';

MaterialApp makeAppWidget(Widget widget) => const MaterialApp(
      title: 'Poke App',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: RouteNames.home,
    );
