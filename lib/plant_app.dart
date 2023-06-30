import 'package:flutter/material.dart';
import 'package:plant_app/splash_screen.dart';

import 'app_theme.dart';

class FarmVilleApp extends StatelessWidget {
  const FarmVilleApp({super.key});

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
