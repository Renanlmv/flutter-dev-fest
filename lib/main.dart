import 'package:devfest/navigation/app_navigation.dart';
import 'package:devfest/navigation/app_routes.dart';
import 'package:devfest/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DevFestApp());
}

class DevFestApp extends StatelessWidget {
  const DevFestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevFest Navigation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppNavigation.generateRoute,
    );
  }
}