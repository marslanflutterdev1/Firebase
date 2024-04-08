import 'package:firebasejourney1/theTechBrotherFirebase/utils/constant.dart';
import 'package:flutter/material.dart';

class LoginWithGoogle extends StatefulWidget {
  const LoginWithGoogle({super.key});

  @override
  State<LoginWithGoogle> createState() => _LoginWithGoogleState();
}

class _LoginWithGoogleState extends State<LoginWithGoogle> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Login With Google',style: Utils.textStyle(),),
        centerTitle: true,
        backgroundColor: Utils.colorPrimary,

      ),

    );
  }
}