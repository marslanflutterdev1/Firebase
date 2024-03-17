import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreDatabaseScreen extends StatefulWidget {
  const FirestoreDatabaseScreen({super.key});

  @override
  State<FirestoreDatabaseScreen> createState() =>
      _FirestoreDatabaseScreenState();
}

class _FirestoreDatabaseScreenState extends State<FirestoreDatabaseScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  uploaddata() async{
    FirebaseFirestore ff= FirebaseFirestore.instance;
   await  ff.collection('Flutter').add({
      'email':email.text,
      'password':password.text
    }).catchError((e){
      debugPrint(e.toString());
    }).whenComplete(() => debugPrint('Thanks of Allah'));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Firestore Database'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: email,
                decoration: const InputDecoration(

                  border: InputBorder.none,
                  hintText: 'Please! Enter Email...',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: password,

                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Please! Enter Password...',
                ),
              ),
            ),
            ElevatedButton(onPressed: () async {
             await uploaddata();

            }, child:const Text('Uploading...'))
          ],
        ),
      )),
    );
  }
}
