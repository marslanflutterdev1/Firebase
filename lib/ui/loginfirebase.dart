import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class loginFirebase {
  static enterText(var email, password) async {
    await firebaseFirestore.collection('Login1').add({
      'email': email,
      'password': password,
    }).catchError((e) {
      return debugPrint(e.toString());
    }).whenComplete(
      () => debugPrint('Login Successfully Thanks Allah'),
    );
  }

  static Future<void> deleteText(String id) async {
    await firebaseFirestore.collection('Login1').doc(id).delete();
  }

  static Future<void> updateText(
      String id, String email, String password) async {
    await firebaseFirestore
        .collection('Login1')
        .doc(id)
        .update({'email': email, 'password': password});
  }
}
