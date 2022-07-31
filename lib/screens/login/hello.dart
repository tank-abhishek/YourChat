import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yourchat/components/blue_image_page_scaffold.dart';
import 'package:yourchat/components/lets_start.dart';
import 'package:yourchat/components/logo.dart';
import 'package:yourchat/components/terms_and_conditions.dart';
import 'package:yourchat/screens/login/edit_number.dart';

class Hello extends StatelessWidget {
  const Hello({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlueImagePageScaffold(
      imagePath: 'images/bg.jpg',
      body: [
        Logo(),
        Text("Hello",style: TextStyle(color: Colors.white.withOpacity(0.7),fontSize: 60) ),
        Column(
          children: [
            Text("This app is created by",style: TextStyle(color: Colors.white.withOpacity(0.7),fontSize: 20)),
            Text("Jayom",style: TextStyle(color: Colors.white.withOpacity(0.7),fontSize: 20)),
            Text("Prince",style: TextStyle(color: Colors.white.withOpacity(0.7),fontSize: 20)),
          ],
        ),
        TermsAndConditions(onPressed: () {},),
        LetsStart(onPressed: () {
          Navigator.push(context, CupertinoPageRoute(builder: (context) => EditNumber()));
        },),
      ],
    );
  }
}
/*Logo(),
              Text("Hello"),
              Column(
                children: [
                  Text("This app is created by"),
                  Text("Jayom"),
                  Text("Prince"),
                ],
              ),
              TermsAndConditions(),
              LetsStart(),*/
