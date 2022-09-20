import 'package:digital_card_service/screens/card_screen.dart';
import 'package:flutter/material.dart';
import 'package:digital_card_service/screens/welcome_screen.dart';
import 'package:digital_card_service/screens/login_screen.dart';
import 'package:digital_card_service/screens/registration_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id : (context) => WelcomeScreen(),
        LoginScreen.id : (context) => LoginScreen(),
        RegistrationScreen.id : (context) => RegistrationScreen(),
        CardScreen.id :(context) => CardScreen(),

      },
    );
  }
}
