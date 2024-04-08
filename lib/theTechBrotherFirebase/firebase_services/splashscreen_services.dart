import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/ui/auth/signin_screen.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/ui/auth/signup_screen.dart';

import 'package:firebasejourney1/theTechBrotherFirebase/ui/homescreen.dart';
import 'package:flutter/material.dart';

class SplashScreenServices {

  static isSignIN(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    final user =auth.currentUser;
    if(user != null){
      Timer(const Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    });

    }else{
      Timer(const Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  SignInScreen()));
    });
    }

    
  }
}
