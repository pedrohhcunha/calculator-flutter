import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String calculation = "";

  double result = 0;

  addCharacter(String text) {
    setState(()  {
      calculation = calculation + text;
    });
  }

  calcResult () {

    print("Entrou aqui");
    List<String> characters = [];
    List<double> numbers = [];

    calculation.split('').forEach((element) => {
      if(element == '*' || element == '/' || element == '-' || element == '+') {
        characters.add(element)
      } else {
        numbers.add(double.parse(element))
      }
    });

    double total = 0;
    int currentCharacter = 0;

    double number1 = numbers[0];
    double number2 = numbers[1];
    switch(characters[currentCharacter]){
      case '+': {
        total = number1 + number2;
        break;
      }
      case '-': {
        total = number1 - number2;
        break;
      }
      case '*': {
        total = number1 * number2;
        break;
      }
      case '/': {
        total = number1 / number2;
        break;
      }
      default: {
        total: total;
        break;
      }
    }
    characters.removeAt(0);

    for(int i = 2 ; i <= numbers.length; i++ ) {

      if(characters.length <= 0) break;

      switch(characters[0]){
        case '+': {
          total = total + numbers[i];
          break;
        }
        case '-': {
          total = total - numbers[i];
          break;
        }
        case '*': {
          total = total * numbers[i];
          break;
        }
        case '/': {
          total = total / numbers[i];
          break;
        }
        default: {
          total: total;
          break;
        }
      }

      characters.removeAt(0);
    }

    print(total);
    setState(() {
      result = total;
    });
  }

  void clearCalculation() {

    setState(() {
      calculation = '';
      result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(color: Colors.black)),
              child: Column(
                children: <Widget>[
                  Text(calculation, style: TextStyle(
                    fontSize: 16,
                  ),),
                  Text(result.toString(), style: TextStyle(
                    fontSize: 32,
                  ),),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  onPressed: () { addCharacter('7'); },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text('7'),
                  padding: EdgeInsets.all(42),
                  shape: CircleBorder(),
                ),
                MaterialButton(
                  onPressed: () { addCharacter('8'); },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text('8'),
                  padding: EdgeInsets.all(42),
                  shape: CircleBorder(),
                ),
                MaterialButton(
                  onPressed: () { addCharacter('9'); },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text('9'),
                  padding: EdgeInsets.all(42),
                  shape: CircleBorder(),
                ),
                MaterialButton(
                  onPressed: () { addCharacter('+'); },
                  color: Colors.black54,
                  textColor: Colors.white,
                  child: Text('+'),
                  padding: EdgeInsets.all(42),
                  shape: CircleBorder(),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  onPressed: () { addCharacter('4'); },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text('4'),
                  padding: EdgeInsets.all(42),
                  shape: CircleBorder(),
                ),
                MaterialButton(
                  onPressed: () { addCharacter('5'); },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text('5'),
                  padding: EdgeInsets.all(42),
                  shape: CircleBorder(),
                ),
                MaterialButton(
                  onPressed: () { addCharacter('6'); },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text('6'),
                  padding: EdgeInsets.all(42),
                  shape: CircleBorder(),
                ),
                MaterialButton(
                  onPressed: () { addCharacter('-'); },
                  color: Colors.black54,
                  textColor: Colors.white,
                  child: Text('-'),
                  padding: EdgeInsets.all(42),
                  shape: CircleBorder(),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  onPressed: () { addCharacter('1'); },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text('1'),
                  padding: EdgeInsets.all(42),
                  shape: CircleBorder(),
                ),
                MaterialButton(
                  onPressed: () { addCharacter('2'); },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text('2'),
                  padding: EdgeInsets.all(42),
                  shape: CircleBorder(),
                ),
                MaterialButton(
                  onPressed: () { addCharacter('3'); },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text('3'),
                  padding: EdgeInsets.all(42),
                  shape: CircleBorder(),
                ),
                MaterialButton(
                  onPressed: () { addCharacter('*'); },
                  color: Colors.black54,
                  textColor: Colors.white,
                  child: Text('*'),
                  padding: EdgeInsets.all(42),
                  shape: CircleBorder(),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  onPressed: () { calcResult(); },
                  color: Colors.black54,
                  textColor: Colors.white,
                  child: Text('='),
                  padding: EdgeInsets.all(42),
                  shape: CircleBorder(),
                ),
                MaterialButton(
                  onPressed: () { addCharacter('0'); },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text('0'),
                  padding: EdgeInsets.all(42),
                  shape: CircleBorder(),
                ),
                MaterialButton(
                  onPressed: clearCalculation,
                  color: Colors.black54,
                  textColor: Colors.white,
                  child: Text('c'),
                  padding: EdgeInsets.all(42),
                  shape: CircleBorder(),
                ),
                MaterialButton(
                  onPressed: () {
                    addCharacter('/');
                  },
                  color: Colors.black54,
                  textColor: Colors.white,
                  child: Text('/'),
                  padding: EdgeInsets.all(42),
                  shape: CircleBorder(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
