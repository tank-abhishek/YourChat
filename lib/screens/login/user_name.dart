import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yourchat/main.dart';

class UserName extends StatelessWidget {
  UserName({Key? key}) : super(key: key);
  var _text = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('user');

  void createUserInFirestore() {
    users
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .limit(1)
        .get()
        .then((QuerySnapshot querySnapshot) {
          if(querySnapshot.docs.isEmpty){
            users.add({
              'name':_text.text,
              'phone':FirebaseAuth.instance.currentUser?.phoneNumber,
              'status' : 'Available',
              'uid': FirebaseAuth.instance.currentUser?.uid
            });
          }
    })
        .catchError((error) {});
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Enter your name"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 45),
            child: CupertinoTextField(
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
              maxLength: 15,
              controller: _text,
              keyboardType: TextInputType.name,
              autofillHints: <String>[AutofillHints.name],
            ),
          ),
          CupertinoButton(
              child: Text("Continue"),
              onPressed: () {
                FirebaseAuth.instance.currentUser!
                    .updateProfile(displayName: _text.text);

                createUserInFirestore();

                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => HomePage()));
              })
        ],
      ),
    );
  }
}
