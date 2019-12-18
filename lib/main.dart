import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(title: 'Joshua Carpentier - Degree Converter'),
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
  String output = ' ';
  double Celcius =0, Fahrenheit = 0 ;
  Calculate calc = Calculate(Fahrenheit: 33, Celcius: 32);//

  void _incrementCounter() {
    setState(() {
      output = calc.doit(Fahrenheit, Celcius);

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
            Text(output,
            style: TextStyle(fontFamily: 'Courier',
            backgroundColor: Colors.black,
            color: Colors.green,
            fontSize: 25,
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Fahrenheit ',
                  fillColor: Colors.lightGreen,
//                  hintText: 'Please go ahead and type something in'
              ),
              keyboardType: TextInputType.number,
              onChanged: (text) {
                Fahrenheit = double.parse(text);
              },
            ),
            Container(
              child: FlatButton(onPressed: _incrementCounter,
                child: Text("Convert To Celcius")),
            margin: EdgeInsets.all(15.0),
            padding: EdgeInsets.all(3.0),
             decoration: BoxDecoration(border: Border.all(
               color: Colors.deepOrange)),),


          ],
        ),
      ),

    );
  }
}

class Calculate{
  // C= (F-32) * 5/9
  double Fahrenheit;
  double Celcius;
  String output = '' ;
  int count;
  String temp = '';
  Calculate({this.Fahrenheit, this.Celcius});

  String doit(Fahrenheit, Celcius) {
    Celcius = (Fahrenheit - 32) * 5/9;
    output = '';

    if (Celcius >= 100.0 ) output = Celcius.toStringAsFixed(1) + ' Water Gas State ';
    else if (Celcius < 100.0  && Celcius > 0.0)  output = Celcius.toStringAsFixed(1) + ' Water in Liquid State ';
    else if (Celcius < 0.0  ) output = Celcius.toStringAsFixed(1) + ' Water is in Solid State ';

    return output;
  }

}
