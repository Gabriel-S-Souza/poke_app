import 'package:flutter/material.dart';

import 'core/routes/app_routes.dart';
import 'core/routes/route_names.dart';
import 'core/theme/theme.dart';
import 'shared/presentation/toast/view/toast_widget.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) => Stack(
        textDirection: TextDirection.ltr,
        children: [
          MaterialApp(
            title: 'Poke App',
            debugShowCheckedModeBanner: false,
            theme: appTheme,
            onGenerateRoute: AppRoutes.generateRoute,
            initialRoute: RouteNames.home,
          ),
          const ToastZoneWidget(
            behavior: ToastBehavior.pinnedDown,
          ),
        ],
      );
}
