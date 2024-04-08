

import 'package:firebase_database/firebase_database.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/utils/constant.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/widgets/reuseRoundedButton.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/widgets/reuseTextFormField.dart';
import 'package:flutter/material.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
 final  ref = FirebaseDatabase.instance.ref('ref create');
 TextEditingController postController = TextEditingController();
 String child = DateTime.now().microsecondsSinceEpoch.toString();
 bool isload = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Add Post Screen',style: Utils.textStyle(),),
        centerTitle: true,
        backgroundColor: Utils.colorPrimary,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: Column(
              children: [
                ReuseTextFormField(
                  hintText: 'Add Post Here...',
                  keyboardType: TextInputType.text,
                  controller:postController,
                 // maxline: 6,
                 // maxlength: 5,

                ),
                ReuseRoundedButton(
                  isLoading: isload,
                  text: 'ADD',
                  onTap: (){
                    setState(() {
                      isload = true;
                    });
                    ref.child(child).set({
                      'id': child,
                      'course':postController.text.toString(),
                    }).then((value){
                      Utils.Toastmsg('Successful Add Post');
                      setState(() {
                        isload = false;
                      });
                    }).onError((error, stackTrace){
                      Utils.Toastmsg(error.toString());
                      setState(() {
                        isload = false;
                      });

                    });

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
