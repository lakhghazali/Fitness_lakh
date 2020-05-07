import 'package:fitness_lakh/screens/onBoarding_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme:AppBarTheme(
          color:Colors.blueAccent
        ),
      
        primarySwatch: Colors.blue,
      ),
      home:OnboardingScreen(),
    );
  }
}

