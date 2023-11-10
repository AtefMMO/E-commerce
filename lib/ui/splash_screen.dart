import 'package:ecommerce/ui/auth/login/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash screen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState;
    navigateToLogin();
  }

  void navigateToLogin() async {
    await Future.delayed(
      Duration(milliseconds: 3000),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Image.asset(
              'assets/images/Splash Screen.png',
              fit: BoxFit.cover,
            ),
            height: double.infinity,
            width: double.infinity));
  }
}
