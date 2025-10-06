import 'package:flutter/material.dart';
import 'package:taskgameproject/screen/splash_screen.dart';
import 'package:taskgameproject/util/routes/appages.dart';
import 'package:taskgameproject/util/routes/approutes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppPages.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
