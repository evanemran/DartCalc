import 'package:flutter/material.dart';

class RoundButton extends StatefulWidget {

  const RoundButton({Key? key,  required this.value, required this.txtColor, required this.btnColor, required this.onTapped}) : super(key: key);

  final String value;
  final Color txtColor, btnColor;
  final VoidCallback? onTapped;

  @override
  State<StatefulWidget> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.onTapped?.call();
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(80,80),
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
        primary: widget.btnColor, // <-- Button color
        onPrimary: Colors.white, // <-- Splash color
      ),
      child: Text(widget.value, style: TextStyle(fontSize: 32, color: widget.txtColor),),
    );
  }

}