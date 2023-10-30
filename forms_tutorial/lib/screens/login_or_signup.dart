import 'package:flutter/material.dart';
import 'package:forms_tutorial/screens/screens.dart';


class LoginOrSignupScreen extends StatefulWidget {
  const LoginOrSignupScreen({super.key});

  @override
  State<LoginOrSignupScreen> createState() => _LoginOrSignupScreenState();
}

class _LoginOrSignupScreenState extends State<LoginOrSignupScreen> {
  //
  bool showLoginScreen = true;

  // togle screens
  void toggleScreens() {
    setState(() {
      showLoginScreen = !showLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginScreen) {
      return LoginScreen(onTap: toggleScreens,);
    } else {
      return SignUpScreen(onTap: toggleScreens);
    }
  }
}
