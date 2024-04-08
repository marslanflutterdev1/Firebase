

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/ui/auth/verifyOPT.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/utils/constant.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/widgets/reuseRoundedButton.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/widgets/reuseTextFormField.dart';
import 'package:flutter/material.dart';

class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({super.key});

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {
  TextEditingController phoneController = TextEditingController();
  final phoneKey = GlobalKey<FormState>();
  FirebaseAuth phoneAuth = FirebaseAuth.instance;
  bool phoneloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login With Phone Number',
          style: Utils.textStyle(),
        ),
        centerTitle: true,
        backgroundColor: Utils.colorPrimary,
      ),
      body: SafeArea(
        child: Center(
          child: Form(
            key: phoneKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                children: [
                  ReuseTextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    hintText: '0300 - 0000 000',
                    prefixIcon: const Icon(Icons.phone_android_outlined),
                  ),
                  ReuseRoundedButton(
                    isLoading: phoneloading,
                    text: 'OPT',
                    onTap: () {
                      setState(() {
                        phoneloading = true;
                      });

                      phoneAuth.verifyPhoneNumber(
                        phoneNumber: phoneController.text.toString(),
                        verificationCompleted: (e) {
                          setState(() {
                            phoneloading = false;
                            Utils.Toastmsg(e.toString());
                          });
                        },
                        verificationFailed: (e) {
                          Utils.Toastmsg(e.toString());
                          setState(() {
                            phoneloading = false;
                          });
                        },
                        codeSent: (String v_id, int? token) async {
                          VerifyOPT.v_ID = v_id.toString();
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (e) => const VerifyOPT()));
                          setState(() {
                            phoneloading = false;
                          });
                        },
                        codeAutoRetrievalTimeout: (e) {
                          Utils.Toastmsg(e.toString());
                          setState(() {
                            phoneloading = false;
                          });
                        },
                      );
                    },
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
