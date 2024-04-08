import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static Color colorPrimary = Colors.purple;
  static Color colorText = Colors.white;
  // static double fontSize = 18;
  // static FontWeight fontWeight = FontWeight.normal;

  static TextStyle textStyle(
      {Color color = Colors.white,
      double fontSize = 20,
      FontWeight fontWeight = FontWeight.normal}) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static Toastmsg(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 50,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}
