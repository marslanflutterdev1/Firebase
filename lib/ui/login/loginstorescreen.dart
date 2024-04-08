import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasejourney1/ui/login/loginscreen1.dart';
import 'package:firebasejourney1/ui/login/updatascreen.dart';
import 'package:flutter/material.dart';
import 'package:firebasejourney1/ui/loginfirebase.dart';

class LoginStoreScreen extends StatefulWidget {
  LoginStoreScreen({super.key});

  @override
  State<LoginStoreScreen> createState() => _LoginStoreScreenState();
}

class _LoginStoreScreenState extends State<LoginStoreScreen> {
  //FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Color baseColor = const Color(0xFFF2F2F2);
  Color textColors = Colors.purpleAccent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: StreamBuilder(
            stream: firebaseFirestore.collection('Login1').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final res = snapshot.data!.docs[index];
                    // return Center(
                    //   child: Card(
                    //     color: Colors.amber,
                    //     child: ExpansionTile(title: Text('${res["password"]}'))),
                    // );
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          loginFirebase.deleteText(res.id);
                        },
                        // background:const Icon(
                        //   Icons.delete_outline_outlined,
                        //   color: Colors.red,
                        // //  size: 30,
                        // ),
                        child: ClayContainer(
                          color: baseColor,
                          height: 70,
                          width: 70,
                          borderRadius: 10,
                          parentColor: textColors,
                          spread: 0.2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClayText(
                                      'E-mail:  ${res['email']}',
                                      color: textColors,
                                      spread: 0,
                                    ),
                                    ClayText(
                                      'Password:  ${res['password']}',
                                      color: textColors,
                                      spread: 0,
                                    ),
                                  ],
                                ),
                             const Spacer(),
                                IconButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => UpdataScreen(
                                    id: res.id,
                                    email: res['email'],
                                    password: res['password'],
                                  ),));
                                }, icon: Icon(Icons.edit,color: textColors,))
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }),
      ),
      floatingActionButton: FloatingActionButton(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen1()));
        },
        child: ClayContainer(
          color: baseColor,
          height: 150,
          width: 150,
          borderRadius: 30,
          spread: 0.5,
          parentColor: textColors,
          child: Icon(
            Icons.add,
            color: textColors,
            size: 30,
          ),
        ),
      ),
    );
  }
}
