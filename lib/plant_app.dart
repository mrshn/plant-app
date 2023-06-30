import 'package:flutter/material.dart';
import 'package:plant_app/features/splash/splash_screen.dart';

import 'constants/app_theme.dart';

class PlantApp extends StatelessWidget {
  const PlantApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (BuildContext context) =>
          "AppLocalizations.of(context)!.appTitle",
      theme: AppTheme.appTheme,
      home: const SplashScreen(),
      routes: {},
    );
  }
}
