import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Joshua Carpentier - Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String t1, t2, output = '';
  double n1, n2;
  Calculate calc = Calculate(num1: 8, num2: 2);

  void _incrementCounter() {
    setState(() {

      _counter++;
      onChanged: (text) {
        t1 = text;
      };
      onChanged: (text) {
        t2 = text;
      };

      print(calc.sum(8 ,2 ) + " " + calc.subtract(8, 2));

      output=calc.sum(n1, n2) + ' . ' + calc.subtract(n1, n2)
          + ' . ' + calc.multiply(n1, n2) + ' . ' + calc.divide(n1, n2) + ' . ' +
          calc.average(n1, n2);


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

            TextField(
              decoration: InputDecoration(
                  labelText: 'Enter First Number',
                  border: OutlineInputBorder(),
                  hintText: 'Please go ahead and type something in'
              ),
              onChanged: (text) {
                t1 = text;
                n1 = double.parse(t1);
              },
            ),

            SizedBox(height: 20,),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Enter Service',
                  border: OutlineInputBorder(),
                  hintText: 'g-good, a-alright, n-notbad, p-poor'
              ),
              onChanged: (text) {
                t1 = text;
                //n2 = double.parse(t2);
              },
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Enter the bill',
                  border: OutlineInputBorder(),
                  hintText: 'How much is the bill'
              ),
              onChanged: (text) {
                t2 = text;
                n2 = double.parse(t2);
              },
            ),



            Text(output),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton
      (
        onPressed: _incrementCounter,
        tooltip: 'Find Tip',
        child: Icon(Icons.star),
      ),

    );
  }
}

class Calculate{
  double num1, num2, result=0;
  Calculate({this.num1, this.num2});

  String sum(double num1, double num2) {
    result = num1 + num2;
    return "The sum is: " + result.toString();
  }

  String multiply(double num1, double num2) {
    result = num1 * num2;
    return "The multiplication is: " + result.toString();
  }

  String divide(double num1, double num2) {
    result = num1 / num2;
    return "The quotient is: " + result.toString();
  }

  String average(double num1, double num2) {
    result = (num1 + num2)/2;
    return "The average is: " + result.toString();
  }

  String subtract(double num1, double num2) {
    result = (num1 - num2);
    return "The subtraction is: " + result.toString();
  }

}
