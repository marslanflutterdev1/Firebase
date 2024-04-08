// ignore: file_names

import 'package:firebasejourney1/theTechBrotherFirebase/utils/constant.dart';
import 'package:flutter/material.dart';

class ReuseRoundedButton extends StatelessWidget {
  ReuseRoundedButton({super.key, this.text, this.onTap,this.isLoading = false});
  String? text;
  VoidCallback? onTap;
  bool isLoading ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          color: Utils.colorPrimary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child:isLoading ? const CircularProgressIndicator(color: Colors.white,strokeWidth: 4,) :Text(
          '$text',
          style: Utils.textStyle(),
        )),
      ),
    );
  }
}
