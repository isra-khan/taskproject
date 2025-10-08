import 'package:flutter/material.dart';
import 'package:taskgameproject/screen/create_a_new_Task_screen.dart';
import 'package:taskgameproject/screen/home_screen.dart';
import 'package:taskgameproject/screen/splash_screen.dart';
import 'package:taskgameproject/util/routes/approutes.dart';

class AppPages {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case AppRoutes.createNewTask:
        return MaterialPageRoute(builder: (_) => CreateANewScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
