import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          shape: BoxShape.rectangle,
          color: Colors.white.withOpacity(0.8)),
      child: Image(
        image: AssetImage('images/logo.png'),
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
