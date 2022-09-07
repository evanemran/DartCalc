import 'package:dart_calc/widgets/expanded_button.dart';
import 'package:dart_calc/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:math_expressions/math_expressions.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = "0";
  String history = "0";
  final _resultTextController = TextEditingController(text: "12345");

  @override
  void initState() {
    super.initState();

    WidgetsFlutterBinding.ensureInitialized();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  VoidCallback? onClicked(String s) {
    setState(() {
      switch (s) {
        case "AC":
          _resultTextController.text = "";
          result = "";
          history = "";
          break;
        case "±":
          break;
        case "%":
          break;
        case "=":
          history = result;
          result = calculate(result);
          break;
        case "+":
          if(result.endsWith("+")){
            break;
          }
          else{
            result = result + s;
          }
          break;
        case "-":
          if(result.endsWith("-")){
            break;
          }
          else{
            result = result + s;
          }
          break;

        case "×":
          if(result.endsWith("×")){
            break;
          }
          else{
            result = result + s;
          }
          break;

        case "÷":
          if(result.endsWith("÷")){
            break;
          }
          else{
            result = result + s;
          }
          break;


        default:
          result = result + s;
          _resultTextController.text = _resultTextController.text + s;
          break;
      }
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(widget.title),
      ),
      body: Text(result,),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Wrap(children: [
          Column(children: [
            Row(children: [Expanded(child: Padding(padding: const EdgeInsets.all(10), child: Text(
              overflow: TextOverflow.ellipsis,
              history, style: const TextStyle(color: Colors.white70, fontSize: 32), textAlign: TextAlign.end,),))],),
            const SizedBox(height: 10,),
            Row(children: [Expanded(child: Padding(padding: const EdgeInsets.all(10), child: Text(
              overflow: TextOverflow.ellipsis,
              result, style: const TextStyle(color: Colors.white, fontSize: 52), textAlign: TextAlign.end,),))],),
            const SizedBox(height: 20,),
            Row(children: [
              Expanded(child: RoundButton(value: "AC", txtColor: Colors.black, btnColor: Colors.white70, onTapped: () {onClicked("AC");},)),
              Expanded(child: RoundButton(value: "±", txtColor: Colors.black, btnColor: Colors.white70, onTapped: () {onClicked("±");},)),
              Expanded(child: RoundButton(value: "%", txtColor: Colors.black, btnColor: Colors.white70, onTapped: () {onClicked("%");},)),
              Expanded(child: RoundButton(value: "÷", txtColor: Colors.white, btnColor: Colors.amber, onTapped: () {onClicked("÷");},)),
            ],),

            const SizedBox(height: 20,),
            Row(children: [
              Expanded(child: RoundButton(value: "7", txtColor: Colors.white, btnColor: Colors.white24, onTapped: () {onClicked("7");},)),
              Expanded(child: RoundButton(value: "8", txtColor: Colors.white, btnColor: Colors.white24, onTapped: () {onClicked("8");},)),
              Expanded(child: RoundButton(value: "9", txtColor: Colors.white, btnColor: Colors.white24, onTapped: () {onClicked("9");},)),
              Expanded(child: RoundButton(value: "×", txtColor: Colors.white, btnColor: Colors.amber, onTapped: () {onClicked("×");},)),
            ],),

            const SizedBox(height: 20,),
            Row(children: [
              Expanded(child: RoundButton(value: "4", txtColor: Colors.white, btnColor: Colors.white24, onTapped: () {onClicked("4");},)),
              Expanded(child: RoundButton(value: "5", txtColor: Colors.white, btnColor: Colors.white24, onTapped: () {onClicked("5");},)),
              Expanded(child: RoundButton(value: "6", txtColor: Colors.white, btnColor: Colors.white24, onTapped: () {onClicked("6");},)),
              Expanded(child: RoundButton(value: "-", txtColor: Colors.white, btnColor: Colors.amber, onTapped: () {onClicked("-");},)),
            ],),

            const SizedBox(height: 20,),
            Row(children: [
              Expanded(child: RoundButton(value: "1", txtColor: Colors.white, btnColor: Colors.white24, onTapped: () {onClicked("1");},)),
              Expanded(child: RoundButton(value: "2", txtColor: Colors.white, btnColor: Colors.white24, onTapped: () {onClicked("2");},)),
              Expanded(child: RoundButton(value: "3", txtColor: Colors.white, btnColor: Colors.white24, onTapped: () {onClicked("3");},)),
              Expanded(child: RoundButton(value: "+", txtColor: Colors.white, btnColor: Colors.amber, onTapped: () {onClicked("+");},)),
            ],),

            const SizedBox(height: 20,),Row(children: [
              Padding(padding: const EdgeInsets.fromLTRB(10, 0, 10, 0), child: Expanded(child: ExpandedButton("0", Colors.white, Colors.white24, () {onClicked("0");})),),
              Padding(padding: const EdgeInsets.fromLTRB(5, 0, 5, 0), child: RoundButton(value: ".", txtColor: Colors.white, btnColor: Colors.amber, onTapped: () {onClicked(".");},),),
              Padding(padding: const EdgeInsets.fromLTRB(10, 0, 5, 0), child: RoundButton(value: "=", txtColor: Colors.white, btnColor: Colors.amber, onTapped: () {onClicked("=");},),),
            ],),

            const SizedBox(height: 20,),
          ],)
        ],),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  String calculate(String equation) {
    if(equation.endsWith("+") || equation.endsWith("-") || equation.endsWith("×") || equation.endsWith("÷")) {
      return equation;
    }
    else {
      String replacedEqn = equation.replaceAll("×", "*").replaceAll("÷", "/");

      ContextModel cm = ContextModel();
      Parser p = Parser();
      Expression expression = p.parse(replacedEqn);
      double eval = expression.evaluate(EvaluationType.REAL, cm);
      return eval.toStringAsFixed(eval.truncateToDouble() == eval ? 0 : 2).toString();
    }
  }

}