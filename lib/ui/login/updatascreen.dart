import 'package:firebasejourney1/firebase_services/loginfirebase.dart';
import 'package:firebasejourney1/ui/login/loginstorescreen.dart';
import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';

class UpdataScreen extends StatefulWidget {
  UpdataScreen({super.key, this.id, this.email, this.password});
  final String? id;
  final String? email;
  final String? password;

  @override
  State<UpdataScreen> createState() => _UpdataScreenState();
}

class _UpdataScreenState extends State<UpdataScreen> {
  Color baseColor = const Color(0xFFF2F2F2);
  Color textColors = Colors.purpleAccent;
  bool isPress = false;
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
        color: baseColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
          child: ClayContainer(
            color: baseColor,
            // height: MediaQuery.of(context).size.height * 0.6,
            // width: MediaQuery.of(context).size.width * 0.8,
            borderRadius: 10,
            curveType: CurveType.none,
            // emboss: true,
            depth: 60,
            spread: 6,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ClayContainer(
                          color: baseColor,
                          height: 65,
                          width: 65,
                          borderRadius: 50,
                          spread: 4,
                          child: Center(
                            child: Icon(
                              Icons.person,
                              color: textColors,
                              size: 45,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        ClayText(
                          'UPDATE',
                          textColor: textColors,
                          size: 22,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 12, right: 12, top: 50),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          ClayContainer(
                            // emboss: isPress?true:false,
                            color: baseColor,
                            height: 50,
                            width: double.infinity,
                            borderRadius: 50,
                            // surfaceColor: Color(0xff555555),
                            //  parentColor: baseColor,
                            // curveType: CurveType.concave,
                            spread: 2,
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter email...';
                                }
                                return null;
                              },
                              controller: emailC,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 11),
                                prefixIcon: const Icon(
                                  Icons.email_sharp,
                                  size: 26,
                                ),
                                hintText: widget.email ?? '',
                                hintStyle: TextStyle(
                                    color: textColors.withOpacity(0.3),
                                    decoration: TextDecoration.none),
                                prefixIconColor: textColors,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ClayContainer(
                            // emboss: isPress?true:false,
                            color: baseColor,
                            height: 50,
                            width: double.infinity,
                            borderRadius: 50,
                            // surfaceColor: Color(0xff555555),
                            //  parentColor: baseColor,
                            // curveType: CurveType.concave,
                            // emboss: true,
                            spread: 2,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter password...';
                                }
                                return null;
                              },
                              controller: passwordC,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 11),
                                prefixIcon: const Icon(
                                  Icons.password_sharp,
                                  size: 26,
                                ),
                                hintText: widget.password ?? '',
                                hintStyle: TextStyle(
                                    color: textColors.withOpacity(0.3),
                                    decoration: TextDecoration.none),
                                prefixIconColor: textColors,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: () async {
                              if (_formkey.currentState!.validate()) {
                                loginFirebase.updateText(
                                    widget.id ?? '', emailC.text, passwordC.text);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LoginStoreScreen(),
                                  ),
                                );
                              }
                              // await loginFirebase.enterText(
                              //     emailC.text, passwordC.text);
                            },
                            child: ClayContainer(
                              // emboss: isPress?true:false,
                              color: baseColor,
                              height: 50,
                              width: double.infinity,
                              borderRadius: 50,
                              // surfaceColor: Color(0xff555555),
                              parentColor: baseColor,
                              // curveType: CurveType.convex,
                              // emboss: true,
                              spread: 2,
                              child: Center(
                                child: ClayText(
                                  'Show Data',
                                  textColor: textColors,
                                  size: 18,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
