import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:digital_card_service/rounded_button.dart';
import 'package:digital_card_service/constants.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registrationScreen';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showSpinner = false;

  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 50.0,
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    height: 105.0,
                  ),
                ),
                Flexible(
                  child:  Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset(
                        'images/DCSlogo.png',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextStyleDecoration.copyWith(
                    hintText: 'Enter your email',
                    hintStyle:  TextStyle(
                      color: Colors.blue.shade900,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextStyleDecoration.copyWith(
                    hintStyle: TextStyle(
                      color: Colors.blue.shade900,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                    color: Color(0xFF027FC5),
                    buttonTitle: 'Register',
                    textColor: Colors.white,
                    onPressed: () async {
                      /* setState((){
                        showSpinner = true; //starts spinning when switching pages while verifying user
                      });
                      try{
                        final newUser = await _auth.createUserWithEmailAndPassword(email:
                        email, password: password);
                        //because newUser returns type Future we want to store it and then make sure we dont move on without knowing
                        //if the user has been created so we must make it async and assign it with the key word " await "

                        if( newUser != null){
                          Navigator.pushNamed(context, ChatScreen.id);
                        }

                        setState((){
                          showSpinner = false; //ends spinning
                        });
                      } catch(e){
                        print(e);
                      } */
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
