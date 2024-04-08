import 'package:firebasejourney1/theTechBrotherFirebase/firebase_services/splashscreen_services.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/utils/constant.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SplashScreenServices.isSignIN(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Utils.colorPrimary,
      body: Center(
        child: Text(
          'Splash Screen',
          style: Utils.textStyle(
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
