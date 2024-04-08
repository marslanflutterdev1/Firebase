import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/ui/homescreen.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/utils/constant.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/widgets/reuseRoundedButton.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/widgets/reuseTextFormField.dart';
import 'package:flutter/material.dart';

class VerifyOPT extends StatefulWidget {
  const VerifyOPT({super.key});
  static String? v_ID;

  @override
  State<VerifyOPT> createState() => _VerifyOPTState();
}

class _VerifyOPTState extends State<VerifyOPT> {
  @override
  Widget build(BuildContext context) {
    // static String? v_ID;
    TextEditingController otpController = TextEditingController();
    final otpKey = GlobalKey<FormState>();
    FirebaseAuth otpAuth = FirebaseAuth.instance;
    bool otpLoading = false;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Verify OPT',
          style: Utils.textStyle(),
        ),
        centerTitle: true,
        backgroundColor: Utils.colorPrimary,
      ),
      body: SafeArea(
        child: Center(
          child: Form(
            key: otpKey,
            child: Column(
              children: [
                ReuseTextFormField(
                  controller: otpController,
                  hintText: 'Enter 6 digits code',
                  keyboardType: TextInputType.number,
                ),
                ReuseRoundedButton(
                  text: 'Verify OTP',
                  isLoading: otpLoading,
                  onTap: () async{
                    setState(() {
                      otpLoading = true;
                    });
                    final credential = PhoneAuthProvider.credential(
                        verificationId: VerifyOPT.v_ID.toString(),
                        smsCode: otpController.text.toString(),
                    );

                 try{
                   await otpAuth.signInWithCredential(credential);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                   setState(() {
                     otpLoading = false;
                   });

                 }catch(e){
                   Utils.Toastmsg(e.toString());
                   setState(() {
                     otpLoading = false;
                   });

                 }


                  },

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
