import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:forms_tutorial/components/components.dart';
import 'package:forms_tutorial/services/auth_services.dart';
import 'package:logger/logger.dart';


class LoginScreen extends StatefulWidget {
  final Function()? onTap;

  const LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  static bool isVisible = true;
  final logger = Logger();

// function to log user in
  void loginUser() async {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      duration: Duration(seconds: 5),
      backgroundColor: Colors.black,
      content: Text('Login you in, please wait...'),
    ));

    await Future.delayed(const Duration(seconds: 5));

    // try login
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      
      

    } on FirebaseAuthException catch (e) {
      // user doesn't exist
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = e.code;
      } else if (e.code == 'wrong-password') {
        errorMessage = e.code;
      } else {
        errorMessage = e.code;
      }

      // Show the error message in a SnackBar
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 3),
        content: Text(errorMessage),
        backgroundColor:
            Colors.red, // Set the background color to red for error messages
      ));
    }
  }

  void wrongEmail() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("User doesnt exist"),
          );
        });
  }

  void wrongPassword() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Password is incorrect"),
          );
        });
  }

  void toggleVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),

                  //logo
                  const Icon(
                    Icons.shopify,
                    size: 100,
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  // some text
                  Text(
                    'Welcome back, you\'ve been missed',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(
                    height: 35,
                  ),

                  // user name field
                  CustomTextField(
                    hintText: 'Enter your email address',
                    controller: emailController,
                    obscureText: false,
                    iconName: const Icon(
                      Icons.person_2,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  //password field
                  CustomTextField(
                    hintText: 'Enter your password',
                    obscureText: isVisible,
                    controller: passwordController,
                    iconName: IconButton(
                        color: Colors.black,
                        onPressed: toggleVisibility,
                        icon: Icon(isVisible
                            ? Icons.visibility
                            : Icons.visibility_off)),
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  //forgot password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forgotten password?",
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  //login button

                  CustomButton(
                    btnTitle: "Login",
                    onTap: loginUser,
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  // or sign up with
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Or Login with",
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                  //google + appple signin
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ContainerTile(
                        onTap: () => AuthServices().signInWithGoogle(),
                        imgPath: "assets/gogle-2.png",
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ContainerTile(
                        onTap: () {},
                        imgPath: "assets/apple-3.png",
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                  //dont have an account sign up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not yet a member?',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            'Sign up here?',
                            style: TextStyle(color: Colors.blue),
                          )),
                          SizedBox(
                            height:20
                          )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
