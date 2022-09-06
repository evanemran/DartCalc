import 'package:flutter/material.dart';

class ExpandedButton extends StatelessWidget {

  final String value;
  Color txtColor, btnColor;
  final VoidCallback? onComplete;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onComplete?.call();
      },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(175,80),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80.0),
              side: BorderSide(color: btnColor)
          ),
          padding: const EdgeInsets.all(20),
          primary: btnColor, // <-- Button color
          onPrimary: Colors.white, // <-- Splash color
        ),
      child: Text(value, style: TextStyle(fontSize: 32, color: txtColor), textAlign: TextAlign.start,)
    );
  }

  ExpandedButton(this.value, this.txtColor, this.btnColor, this.onComplete);
}