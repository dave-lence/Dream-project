import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:forms_tutorial/components/components.dart';
import 'package:forms_tutorial/services/auth_services.dart';

class SignUpScreen extends StatefulWidget {
  final Function()? onTap;
  const SignUpScreen({super.key, required this.onTap});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  static bool isVisible = true;

  //sign un user
  void signinUser() async {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      duration: Duration(seconds: 5),
      backgroundColor: Colors.black,
      content: Text('Creating your account, please wait...'),
    ));

    await Future.delayed(const Duration(seconds: 5));

    // try login
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 3),
          content: Text("Passords do not match"),
          backgroundColor:
              Colors.red, // Set the background color to red for error messages
        ));
      }
    } on FirebaseAuthException catch (e) {
      // user doesn't exist
      String errorMessage;

      errorMessage = e.code;

      // Show the error message in a SnackBar
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 3),
        content: Text(errorMessage),
        backgroundColor:
            Colors.red, // Set the background color to red for error messages
      ));
    }
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
                    'Let\'s create an account for you',
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
                    hintText: 'Enter your username',
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
                    hintText: 'Create your password',
                    obscureText: isVisible,
                    controller: passwordController,
                    iconName: IconButton(
                        color: Colors.black,
                        onPressed: toggleVisibility,
                        icon: Icon(isVisible
                            ? Icons.visibility
                            : Icons.visibility_off)),
                  ),

                  // confirm password

                  const SizedBox(
                    height: 15,
                  ),
                  //password field
                  CustomTextField(
                    hintText: 'Confirm your password',
                    obscureText: isVisible,
                    controller: confirmPasswordController,
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

                  const SizedBox(
                    height: 30,
                  ),
                  //login button

                  CustomButton(
                    btnTitle: 'Sign Up',
                    onTap: signinUser,
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
                            "Or sign up with",
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
                        'Already a member?',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            'Login here?',
                            style: TextStyle(color: Colors.blue),
                          )),
                    ],
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
