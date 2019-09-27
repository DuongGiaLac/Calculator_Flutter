import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

main() {
  runApp(KeyBoard());
}

class KeyBoard extends StatefulWidget {
  @override
  _KeyBoardState createState() => _KeyBoardState();
}

class _KeyBoardState extends State<KeyBoard> {
  @override
  List<String> key = [
    '7',
    '8',
    '9',
    '<-',
    '4',
    '5',
    '6',
    'AC',
    '1',
    '2',
    '3',
    '/',
    '.',
    '0',
    '-',
    'X',
    '=',
    '+'
  ];

  String output = '0';
  double num1;
  double num2;
  String expression;

  List<Widget> makeKeyboard() {
    List<Widget> keyboard = [];
    for (var k in key) {
      keyboard.add(makeButton(k));
    }
    return keyboard;
  }

  Widget makeButton(String text) {
    return Expanded(
        child: SizedBox(
            height: 111,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              hoverColor: Colors.black,
              onPressed: () => getButtonValue(text),
              shape: Border.all(
                color: Colors.grey,
                width: 0.1,
                style: BorderStyle.solid,
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                ),
              ),
            )));
  }

  getButtonValue(String text) {
    switch (text) {
      case 'AC':
        num1 = 0;
        num2 = 0;
        setState(() => output = '0');
        break;
      case '<-':
        {
          setState(() => output = output.substring(0, output.length - 1));
          if (output.length == 0) {
            setState(() => output = '0');
          }
        }
        break;
      case '+':
        {
          num1 = double.parse(output);
          expression = '+';
          setState(() => output = '0');
        }
        break;
      case '-':
        {
          num1 = double.parse(output);
          expression = '-';
          setState(() => output = '0');
        }
        break;
      case 'X':
        {
          num1 = double.parse(output);
          expression = 'X';
          setState(() => output = '0');
        }
        break;
      case '/':
        {
          num1 = double.parse(output);
          expression = '/';
          setState(() => output = '0');
        }
        break;
      case '=':
        {
          num2 = double.parse(output);
          switch (expression) {
            case '+':
              setState(() => output = (num1 + num2).toString());
              break;
            case '-':
              setState(() => output = (num1 - num2).toString());
              break;
            case 'X':
              setState(() => output = (num1 * num2).toString());
              break;
            case '/':
              {
                if (num2 == 0) {
                  setState(() => output = 'Error: Devided by zero');
                } else {
                  setState(() => output = (num1 / num2).toString());
                }
              }
              break;
          }
        }
        break;
      default:
        {
          if (output == '0') {
            output = output.substring(0, 0);
          }
          setState(() => output += text);
        }
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        backgroundColor: Color.fromRGBO(222, 222, 222, 1),
        appBar: AppBar(
          title: Text('Calculator'),
        ),
        body: Container(
            child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 50,
              ),
              child: Text(
                output,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    makeButton('7'),
                    makeButton('8'),
                    makeButton('9'),
                    makeButton('<-'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    makeButton('4'),
                    makeButton('5'),
                    makeButton('6'),
                    makeButton('+'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    makeButton('1'),
                    makeButton('2'),
                    makeButton('3'),
                    makeButton('-'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    makeButton('.'),
                    makeButton('0'),
                    makeButton('X'),
                    makeButton('/'),
                  ],
                ),
                Row(children: <Widget>[
                  makeButton('AC'),
                  makeButton('='),
                ]),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
