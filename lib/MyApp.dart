import 'package:flutter/material.dart';
import 'package:islami/ui/onboarding_screen/onboarding_screens/onboarding_screen.dart';

import 'ui/home/screen/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding App',
      theme: ThemeData(
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(color: Colors.white),
          ),
        ),
      ),
      initialRoute: HomeScreen.routName,
      routes: {
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        HomeScreen.routName: (context) => HomeScreen(),
      },
    );
  }
}
