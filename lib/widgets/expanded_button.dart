import 'package:flutter/material.dart';

class ExpandedButton extends StatelessWidget {

  final String value;
  Color txtColor, btnColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(value, style: TextStyle(fontSize: 32, color: txtColor),),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(175,80),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80.0),
              side: BorderSide(color: btnColor)
          ),
          padding: EdgeInsets.all(20),
          primary: btnColor, // <-- Button color
          onPrimary: Colors.white, // <-- Splash color
        )
    );
  }

  ExpandedButton(this.value, this.txtColor, this.btnColor);
}