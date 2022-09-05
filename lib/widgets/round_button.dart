import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {

  final String value;
  Color txtColor, btnColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(value, style: TextStyle(fontSize: 22, color: txtColor),),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(80,80),
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
        primary: btnColor, // <-- Button color
        onPrimary: Colors.white, // <-- Splash color
      ),
    );
  }

  RoundButton(this.value, this.txtColor, this.btnColor);
}