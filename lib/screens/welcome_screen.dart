import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:digital_card_service/constants.dart';
import 'package:flutter/material.dart';
import 'package:digital_card_service/rounded_button.dart';
import 'package:digital_card_service/screens/login_screen.dart';
import 'package:digital_card_service/screens/registration_screen.dart';
import 'package:digital_card_service/screens/card_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcomeScreen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with TickerProviderStateMixin {

    late AnimationController controller;
    late AnimationController controller2;
    late Animation animation;
    late Animation animation2;

  @override

  void initState() {


    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), //1500 milliseconds is 1.5 seconds
    );

    controller2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000),
    );

    animation = ColorTween(begin: kBackgroundColor, end: Colors.white).animate(controller);

    animation2 = CurvedAnimation(parent: controller2, curve: Curves.slowMiddle);
    controller.forward(); //going to proceed our animation forwards
    controller2.forward();
    controller.addListener(() {
      setState(() { });
      print(animation.value);
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            /* Hero(
              tag: 'logo' ,
              child: AnimatedContainer(
                height: controller2.value * 200 ,
                width: controller2.value * 200 ,
                color: Colors.blueAccent,
                duration: const Duration(seconds: 2),
                child: const Center(
                    child: Text(
                      'DCS',
                      style: TextStyle(
                        fontSize: 80.0,
                      ),
                    ),
                ),
              ),
            ), */
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  child: Image.asset(
                    'images/DCSlogo.png',
                  ),
                  height: controller2.value * 450 ,
                ),
              ),
            ),
            // SizedBox(
            //   height: 48.0,
            // ),
            RoundedButton(
                buttonTitle: "Log In",
                color: Color(0xFF08ACF0),
                textColor: Colors.white,
                onPressed: (){
                  Navigator.pushNamed(context, LoginScreen.id);
                }
            ),
            RoundedButton(
              color: Color(0xFF027FC5),
              buttonTitle: 'Register',
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
            RoundedButton(
                color: Color(0xFF1F54A4),
                buttonTitle: 'Scan Card',
                textColor: Colors.white,
                onPressed: (){
                  Navigator.pushNamed(context, CardScreen.id);
                }),
          ],
        ),
      ),
    );
  }
}
