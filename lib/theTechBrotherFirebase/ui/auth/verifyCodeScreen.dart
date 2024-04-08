import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/ui/homescreen.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/utils/constant.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/widgets/reuseRoundedButton.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/widgets/reuseTextFormField.dart';
import 'package:flutter/material.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key,  this.verificationId});
  final String? verificationId;

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {

  final TextEditingController verifyCodeController = TextEditingController();
  final FirebaseAuth  verifyCodeAuth = FirebaseAuth.instance;
  final _verfyCodeFormKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Verification Code Screen',style: Utils.textStyle(),),
        centerTitle: true,
        backgroundColor: Utils.colorPrimary,
      ),
      body: SafeArea(
        child: Form(
          key: _verfyCodeFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ReuseTextFormField(
                controller: verifyCodeController,
                keyboardType: TextInputType.number,
                hintText: 'verify code 6 digits',


              ),
              ReuseRoundedButton(
                text: 'verify  otp code',
                isLoading: isLoading,
                onTap: () async{
                  setState(() {
                    isLoading = true;
                  });
                  final crendital = PhoneAuthProvider.credential(
                      verificationId: widget.verificationId.toString(),
                      smsCode:verifyCodeController.text.toString()
                  );
                  try{
                  await  verifyCodeAuth.signInWithCredential(crendital);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
                    setState(() {
                      isLoading = false;
                    });

                  }catch(e){
                    Utils.Toastmsg(e.toString());
                    setState(() {
                      isLoading = false;
                    });

                  }
                },

              )

            ],
          ),
        ),
      ),

    );
  }
}