import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/ui/auth/loginwithphonenumber.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/ui/auth/signInWithPhoneNumberScreen.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/ui/auth/signup_screen.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/ui/homescreen.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/utils/constant.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/widgets/reuseRoundedButton.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/widgets/reuseTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailConS = TextEditingController();
  TextEditingController passwordConS = TextEditingController();
  bool isLoading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    emailConS.dispose();
    passwordConS.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('SIGN IN SCREEN', style: Utils.textStyle()),
        backgroundColor: Utils.colorPrimary,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  ReuseTextFormField(
                    controller: emailConS,
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
                    controller: passwordConS,
                    keyboardType: TextInputType.text,
                    hintText: 'Enter password...',
                    prefixIcon: const Icon(Icons.password_rounded, size: 28),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Enter email...';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  ReuseRoundedButton(
                    isLoading: isLoading,
                    text: 'SIGN IN',
                    onTap: () {
                      if (_formKey.currentState != null &&
                          _formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });

                        _auth
                            .signInWithEmailAndPassword(
                          email: emailConS.text.toString(),
                          password: passwordConS.text.toString(),
                        )
                            .then((value) {
                        //  Utils.Toastmsg(value.user!.email.toString());
                          setState(() {
                            isLoading = false;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );
                          Utils.Toastmsg('successful');
                        }).onError((error, stackTrace) {
                          setState(() {
                            isLoading = false;
                          });
                          Utils.Toastmsg(error.toString());
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account",
                        style: Utils.textStyle(
                            color: Colors.black54, fontSize: 18),
                      ),
                      TextButton(
                        onPressed: () {
                          if (_formKey.currentState != null &&
                              _formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()),
                            );
                          }
                        },
                        child: const Text('SIGN UP'),
                      ),
                    ],
                  ),
                  ReuseRoundedButton(
                    text: 'SIGN IN WITH PHONE NUMBER',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SignInWithPhoneNumberScreen()));
                    },
                  ),
                  const SizedBox(height: 10),

              ReuseRoundedButton(
                text: 'Login With Phone Number',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder:(e)=>const LoginWithPhoneNumber()));
                },

              ),
                  const SizedBox(height: 10),
              ReuseRoundedButton(
                text: 'Login With Google',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (e) => const HomeScreen()));
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
