import 'package:dart_calc/widgets/expanded_button.dart';
import 'package:dart_calc/widgets/round_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(widget.title),
      ),
      body: Text("hello"),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Wrap(children: [
          Column(children: [
            SizedBox(height: 20,),
            Row(children: [
              Expanded(child: RoundButton("AC", Colors.black, Colors.white70)),
              Expanded(child: RoundButton("+/-", Colors.black, Colors.white70)),
              Expanded(child: RoundButton("%", Colors.black, Colors.white70)),
              Expanded(child: RoundButton("/", Colors.white, Colors.amber)),
            ],),

            SizedBox(height: 20,),
            Row(children: [
              Expanded(child: RoundButton("7", Colors.white, Colors.white24)),
              Expanded(child: RoundButton("8", Colors.white, Colors.white24)),
              Expanded(child: RoundButton("9", Colors.white, Colors.white24)),
              Expanded(child: RoundButton("x", Colors.white, Colors.amber)),
            ],),

            SizedBox(height: 20,),
            Row(children: [
              Expanded(child: RoundButton("4", Colors.white, Colors.white24)),
              Expanded(child: RoundButton("5", Colors.white, Colors.white24)),
              Expanded(child: RoundButton("6", Colors.white, Colors.white24)),
              Expanded(child: RoundButton("-", Colors.white, Colors.amber)),
            ],),

            SizedBox(height: 20,),
            Row(children: [
              Expanded(child: RoundButton("1", Colors.white, Colors.white24)),
              Expanded(child: RoundButton("2", Colors.white, Colors.white24)),
              Expanded(child: RoundButton("3", Colors.white, Colors.white24)),
              Expanded(child: RoundButton("+", Colors.white, Colors.amber)),
            ],),

            SizedBox(height: 20,),Row(children: [
              Expanded(child: ExpandedButton("0", Colors.white, Colors.white24)),
              Expanded(child: RoundButton(".", Colors.white, Colors.amber)),
              Expanded(child: RoundButton("=", Colors.white, Colors.amber)),
            ],),

            SizedBox(height: 20,),
          ],)
        ],),
        elevation: 0,
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}