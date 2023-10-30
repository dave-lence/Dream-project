import 'package:flutter/material.dart';
import 'package:forms_tutorial/screens/auth_screen.dart';
import 'package:tbib_splash_screen/splash_screen_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
   bool isLoaded = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 10)).then((value) => setState(() {
          isLoaded = true;
        }));
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenView(
        navigateWhere: isLoaded,
        duration: Duration(seconds: 8),
        navigateRoute: AuthScreen(),
        pageRouteTransition: PageRouteTransition.CupertinoPageRoute,
        linearGradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 105, 102, 105),
              Color.fromARGB(255, 78, 76, 141),
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(0.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
        text: WavyAnimatedText(
          "Welome On Board",
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 32.0,
            fontWeight: FontWeight.w900,
          ),
        ),
       
        imageSrc:  "assets/w-logo.png",
        //  displayLoading: false,
      ),
    );
  }
}