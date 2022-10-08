import 'package:flutter/material.dart';
import 'package:teste/components/Header.dart';
import 'package:teste/components/Keyboard.dart';
import 'package:teste/components/Screen.dart';
import 'package:teste/utils/calcExpression.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({ super.key });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String calculation = '';
  double result = 0;

  addCharacter(String text) {
    setState(()  {
      calculation = calculation + text;
    });
  }
  calcResult() {
    setState(() {
      result = calcExpression(calculation);
    });
  }
  clearScreen() {
    setState(() {
      calculation = '';
      result = 0;
    });
  }
  clearCalculation() {

    setState(() {
      calculation = '';
      result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Header(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Screen(context, calculation, result.toString()),
            SizedBox( height: 12, ),
            Keyboard(context, (string) { addCharacter(string);}, calcResult, clearScreen )
          ],
        ),
      ),
    );
  }
}
