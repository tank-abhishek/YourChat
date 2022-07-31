import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yourchat/components/logo.dart';
import 'package:yourchat/screens/login/select_country.dart';
import 'package:yourchat/screens/login/verify_number.dart';

class EditNumber extends StatefulWidget {
  const EditNumber({Key? key}) : super(key: key);

  @override
  _EditNumberState createState() => _EditNumberState();
}

class _EditNumberState extends State<EditNumber> {
  var _enterPhoneNumber = TextEditingController();
  Map<String, dynamic> data = {"name": "India", "code": "+91"};
  late Map<String, dynamic> dataResult;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Edit number"),
          previousPageTitle: "Back",
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Logo(),
                Text(
                  "Verification * first step",
                  style: TextStyle(
                      color: Color(0xff145C9E).withOpacity(0.7), fontSize: 20),
                )
              ],
            ),
            Text(
              "Enter your number plz...",
              style: TextStyle(
                  color: CupertinoColors.systemGrey.withOpacity(0.7),
                  fontSize: 30),
            ),
            CupertinoListTile(
              onTap: () async {
                dataResult = await Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => SelectCountry()));
                setState(() {
                  if(dataResult != null) data = dataResult;
                });
              },
              title: Text(
                data['name'],
                style: TextStyle(
                  color: Color(0xff145C9E),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    data['code'],
                    style: TextStyle(
                        fontSize: 25, color: CupertinoColors.secondaryLabel),
                  ),
                  Expanded(
                      child: CupertinoTextField(
                    placeholder: "Your Number",
                    controller: _enterPhoneNumber,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontSize: 25, color: CupertinoColors.secondaryLabel),
                  ))
                ],
              ),
            ),
            Text(
              "You will receive an activation code in short time",
              style: TextStyle(color: CupertinoColors.systemGrey, fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: CupertinoButton.filled(
                  child: Text("Request code"), onPressed: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => VerifyNumber(number: data['code']!+ _enterPhoneNumber.text,)));
              }),
            )
          ],
        ));
  }
}
