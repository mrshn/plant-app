import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../plant_app_home_screen.dart';
import '../onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String path = '/';

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_SplashScreenState>()?.restartApp();
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Key key = UniqueKey();
  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  Future<bool> _jobWhileSplash() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isviewed = prefs.getInt('onBoard') == 0;
    return false;

    if (isviewed == null || !isviewed) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _jobWhileSplash(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Splash Screen"),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        } else {
          if (snapshot.data == true) {
            // If failure null than go to home page
            return PlantAppHomeScreen();
          } else {
            if (snapshot.data == false) {
              return OnBoardingScreen();
            } else {
              // Return ErrorrenousScreen
              return Container();
            }
          }
        }
      },
    );
  }
}
