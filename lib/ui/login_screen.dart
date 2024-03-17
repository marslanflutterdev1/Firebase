// ignore_for_file: unnecessary_const

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPress = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login() async {
    FirebaseFirestore login = await FirebaseFirestore.instance;
    await login.collection('Login').add({
      'email': emailController.text,
      'password': passwordController.text,
    }).catchError((e) {
      debugPrint(e.toString());
    }).whenComplete(() => debugPrint('Login Successful... Thanks of Allah'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
        color: const Color(0xffecf0f3),
        child: Card(
          elevation: 8,
          margin: const EdgeInsets.all(40),
          color: const Color(0xffecf0f3),
          shadowColor: const Color(0xff555555),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: const Color(0xffecf0f3),
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: const Image(
                          image: AssetImage('Assets/Images/arslan.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Text(
                      'Flutter Development',
                      style: TextStyle(
                          color: Color(0xff555555),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Made easy...',
                      style: TextStyle(
                          color: Color(0xff555555),
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 12),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xffecf0f3),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(decoration: TextDecoration.none),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          // border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Color(0xff555555),
                          ),
                          hintText: 'Enter email...',
                          hintStyle: TextStyle(
                              color: Color(0xff555555),
                              decoration: TextDecoration.none),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xffecf0f3),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        controller: passwordController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(decoration: TextDecoration.none),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          // border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.password_outlined,
                            color: Color(0xff555555),
                          ),
                          hintText: 'Enter password...',
                          hintStyle: TextStyle(
                              color: Color(0xff555555),
                              decoration: TextDecoration.none),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        await login();
                      },
                      child: Container(
                        margin:
                            const EdgeInsets.only(left: 12, right: 12, top: 25),
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xff02c8db),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Forgot password?',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: Color(0xff555555)),
                          ),
                          TextSpan(
                            text: ' OR ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff555555)),
                          ),
                          TextSpan(
                            text: 'Sign-Up',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: Color(0xff555555)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
