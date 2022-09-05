import 'package:flutter/material.dart';

class ExpandedButton extends StatelessWidget {

  final String value;
  Color txtColor, btnColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(value, style: TextStyle(fontSize: 22, color: txtColor),),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(160,80)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0),
                  side: BorderSide(color: Colors.white24)
              )
          )
      ),
    );
  }

  ExpandedButton(this.value, this.txtColor, this.btnColor);
}