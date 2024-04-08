import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/ui/addpost.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/ui/auth/signin_screen.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/utils/constant.dart';
import 'package:firebasejourney1/theTechBrotherFirebase/widgets/reuseTextFormField.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('ref create');

  TextEditingController filterController = TextEditingController();
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Screen',
          style: Utils.textStyle(),
        ),
        centerTitle: true,
        backgroundColor: Utils.colorPrimary,
        actions: [
          IconButton(
            onPressed: () {
              auth.signOut().then((value) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              }).onError((error, stackTrace) {
                Utils.Toastmsg(error.toString());
              });
            },
            icon: Icon(
              Icons.logout_outlined,
              size: 28,
              color: Utils.colorText,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            ReuseTextFormField(
              controller: filterController,
              hintText: 'Searching...',
              prefixIcon: const Icon(Icons.search_sharp),
              onChange: (e) {
                setState(() {});
              },
            ),
            Expanded(
              child: FirebaseAnimatedList(
                query: ref,
                defaultChild: const Text('loading'),
                itemBuilder: (context, snapshot, animation, index) {
                  final title = snapshot.child('course').value.toString();
                  final id = snapshot.child('id').value.toString();

                  if (filterController.text.isEmpty) {
                    return ListTile(
                        title: Text(id),
                        subtitle: Text(title),
                        trailing: PopupMenuButton(
                          icon: const Icon(Icons.more_vert),
                          itemBuilder: (BuildContext bc) {
                            return [
                              PopupMenuItem(
                                onTap: () {
                                // Navigator.pop(context);
                                  showMyDialog(course: title, id: id);
                                },
                                child: const ListTile(
                                  leading: Icon(Icons.edit),
                                  title: Text('Edit'),
                                ),
                              ),
                              PopupMenuItem(
                                child: ListTile(
                                  leading: Icon(Icons.delete),
                                  title: Text('Delete'),
                                  onTap: () {
                                    Navigator.pop(context);
                                   ref.child(id).remove();
                                   Utils.Toastmsg('Delete');
                                  },
                                ),
                              ),
                            ];
                          },
                        ));
                  } else if (title
                      .toLowerCase()
                      .contains(filterController.text.toLowerCase())) {
                    return ListTile(
                      title: Text(id),
                      subtitle: Text(title),
                    );
                  } else {
                    // Return an empty container for non-matching items
                    return Container();
                  }
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (e) => const AddPostScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  showMyDialog({required String course, required String id}) {
    editingController.text = course;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Editing'),
            content: ReuseTextFormField(
              controller: editingController,
              hintText: 'show dialog',
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ref.child(id).update({
                      'course': editingController.text.toString(),
                    }).then((value) {
                      Utils.Toastmsg('Successful Update');
                    }).onError((error, stackTrace) {
                      Utils.Toastmsg(error.toString());
                    });
                  },
                  child: Text('Update')),

            ],
          );
        });
  }
}
