import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:forms_tutorial/screens/login_or_signup.dart';
import 'package:forms_tutorial/screens/screens.dart';


class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user logged in
          if (snapshot.hasData) {
            return  HomeScreen();
          }
          // user logged out
          else {
            return LoginOrSignupScreen();
          } 
        },
      ),
    );
  }
}
