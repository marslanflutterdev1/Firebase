import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/ui/auth/signin_screen.dart';

import 'package:firebasejourney1/theTechBrotherFirebase/utils/constant.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/widgets/reuseRoundedButton.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/widgets/reuseTextFormField.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailCon = TextEditingController();

  TextEditingController passwordCon = TextEditingController();

  TextEditingController nameCon = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailCon.dispose();
    passwordCon.dispose();
    nameCon.dispose();
    //super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('SIGN UP SCREEN', style: Utils.textStyle()),
        backgroundColor: Utils.colorPrimary,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 90,
                  ),
                  ReuseTextFormField(
                    controller: nameCon,
                    keyboardType: TextInputType.name,
                    hintText: 'Enter user name...',
                    prefixIcon: const Icon(Icons.person_2_rounded, size: 28),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Enter name...';
                      }
                      return null;
                    },
                  ),
                  ReuseTextFormField(
                    controller: emailCon,
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Enter email...',
                    prefixIcon: const Icon(Icons.email_rounded, size: 28),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Enter email...';
                      }
                      return null;
                    },
                  ),
                  ReuseTextFormField(
                    controller: passwordCon,
                    keyboardType: TextInputType.number,
                    hintText: 'Enter password...',
                    prefixIcon: const Icon(Icons.lock_rounded, size: 28),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Enter password...';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  ReuseRoundedButton(
                    text: 'SIGN UP',
                    isLoading: isLoading,
                    onTap: () {
                      if (formKey.currentState != null &&
                          formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        _auth
                            .createUserWithEmailAndPassword(
                          email: emailCon.text.toString(),
                          password: passwordCon.text.toString(),
                        )
                            .then(
                          (value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInScreen ()),

                            );
                            Utils.Toastmsg('Successfully signup');
                            setState(
                              () {
                                isLoading = false;
                              },
                            );
                          },
                        ).onError((error, stackTrace) {
                          setState(() {
                            isLoading = false;
                          });
                          Utils.Toastmsg('Error Block:' + error.toString());
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have a SIGN IN",
                        style: Utils.textStyle(
                            color: Colors.black54, fontSize: 18),
                      ),
                      TextButton(
                          onPressed: () {
                            if (formKey.currentState != null &&
                                formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInScreen()),
                              );
                            }
                          },
                          child: const Text('SIGN IN'))
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
