import 'package:flutter/material.dart';
import 'log_in.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate splash duration then navigate
    Future.delayed(const Duration(seconds: 3), () {
      // TODO: Replace with your next screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LogIn()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:  Image.asset(
          'assets/images/royal baby logo.png',
          width: screenHeight * 0.22,
          height: screenHeight * 0.22,
        ),
      ),
    );
  }
}
