

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/ui/auth/verifyCodeScreen.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/utils/constant.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/widgets/reuseRoundedButton.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/widgets/reuseTextFormField.dart';
import 'package:flutter/material.dart';

class SignInWithPhoneNumberScreen extends StatefulWidget {
  SignInWithPhoneNumberScreen({super.key});

  @override
  State<SignInWithPhoneNumberScreen> createState() => _SignInWithPhoneNumberScreenState();
}

class _SignInWithPhoneNumberScreenState extends State<SignInWithPhoneNumberScreen> {
  TextEditingController signInWithPhoneNumberController =
      TextEditingController();

  FirebaseAuth phoneNumberAuth = FirebaseAuth.instance;
  bool isLoading = false;
  final phoneNumberkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Phone Number Screen',
          style: Utils.textStyle(),
        ),
        backgroundColor: Utils.colorPrimary,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: phoneNumberkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ReuseTextFormField(
                controller: signInWithPhoneNumberController,
                keyboardType: TextInputType.phone,
                hintText: '0300 - 0000 000',
                prefixIcon: const Icon(Icons.phone_android_outlined),
              ),
              ReuseRoundedButton(
                isLoading: isLoading,
                text: 'Phone Number',
                onTap: () {
                  setState(() {
                    isLoading  = true;
                  });
                  phoneNumberAuth.verifyPhoneNumber(
                    phoneNumber: signInWithPhoneNumberController.text.toString(),
                    verificationCompleted: (e) {
                      setState(() {
                        isLoading  = false;
                      });
                    },
                    verificationFailed: (e) {
                      setState(() {
                        isLoading  = false;
                      });
                      Utils.Toastmsg(e.toString());
                    },
                    codeSent: (String verificationId, int? token) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerifyCodeScreen(
                            verificationId: verificationId,
                          ),
                        ),
                      );
                      setState(() {
                        isLoading  = false;
                      });
                    },
                    codeAutoRetrievalTimeout: (e) {
                      Utils.Toastmsg(e.toString());
                      setState(() {
                        isLoading  = false;
                      });
                    },
                  );
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
